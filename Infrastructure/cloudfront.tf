# cloudfront.tf
#
# Public entry point for CMDB: user -> CloudFront -> API Gateway (execute-api URL) -> VPC Link
# -> shared ALB -> EC2. CloudFront adds the security response headers ZAP asks for.
# API Gateway rewrites the Host header to var.alb_origin_id so the ALB host rule matches
# (see apigateway.tf).

# CloudFront only accepts ACM certificates from us-east-1. This provider is used for that
# lookup only; CloudFront resources are global and use the default provider.
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

data "aws_acm_certificate" "cmdb_cloudfront_certificate" {
  provider    = aws.us-east-1
  domain      = var.application_url
  statuses    = ["ISSUED"]
  most_recent = true
}

data "aws_cloudfront_cache_policy" "caching_disabled" {
  name = "Managed-CachingDisabled"
}

# Forwards cookies, query strings and headers, but not Host: CloudFront must send the
# execute-api hostname to API Gateway, which then rewrites Host for the ALB.
data "aws_cloudfront_origin_request_policy" "all_viewer_except_host_header" {
  name = "Managed-AllViewerExceptHostHeader"
}

locals {
  api_gateway_domain = replace(module.api_gateway.apigatewayv2_api_api_endpoint, "https://", "")

  # CMDBuild's ExtJS UI needs inline scripts/styles and eval. frame-ancestors is 'self'
  # (not 'none') because CMDBuild frames its own pages.
  content_security_policy = join(" ", [
    "default-src 'self';",
    "script-src 'self' 'unsafe-inline' 'unsafe-eval';",
    "style-src 'self' 'unsafe-inline';",
    "img-src 'self' data: blob:;",
    "font-src 'self' data:;",
    "connect-src 'self';",
    "frame-src 'self' blob:;",
    "worker-src 'self' blob:;",
    "object-src 'none';",
    "frame-ancestors 'self';",
    "base-uri 'self';",
    "form-action 'self';",
    "upgrade-insecure-requests;",
  ])
}

resource "aws_cloudfront_response_headers_policy" "security_headers_policy" {
  name    = "${var.application}-security-headers"
  comment = "HSTS, CSP, frame/content-type/referrer and Permissions-Policy for CMDB"

  security_headers_config {
    strict_transport_security {
      access_control_max_age_sec = 31536000
      include_subdomains         = true
      preload                    = false
      override                   = true
    }

    content_type_options {
      override = true
    }

    frame_options {
      frame_option = "SAMEORIGIN"
      override     = true
    }

    referrer_policy {
      referrer_policy = "strict-origin-when-cross-origin"
      override        = true
    }

    content_security_policy {
      content_security_policy = local.content_security_policy
      # CMDBuild sends no CSP of its own, so true makes CloudFront's policy always apply and the result predictable.
      override = true
    }
  }

  custom_headers_config {
    items {
      header   = "Permissions-Policy"
      value    = "camera=(), microphone=(), geolocation=(), payment=(), usb=(), fullscreen=(self)"
      override = true
    }
  }

  # Hide server/framework version details (ZAP "server leaks version information").
  remove_headers_config {
    items {
      header = "Server"
    }
    items {
      header = "X-Powered-By"
    }
  }
}

resource "aws_cloudfront_distribution" "cmdb_distribution" {
  origin {
    domain_name = local.api_gateway_domain
    origin_id   = local.api_gateway_domain

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "https-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  aliases         = [var.application_url]
  enabled         = true
  is_ipv6_enabled = true
  comment         = "${var.application}-${var.target_env}-cloudfront"
  price_class     = "PriceClass_100"

  default_cache_behavior {
    allowed_methods            = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    cached_methods             = ["GET", "HEAD"]
    target_origin_id           = local.api_gateway_domain
    cache_policy_id            = data.aws_cloudfront_cache_policy.caching_disabled.id
    origin_request_policy_id   = data.aws_cloudfront_origin_request_policy.all_viewer_except_host_header.id
    response_headers_policy_id = aws_cloudfront_response_headers_policy.security_headers_policy.id
    compress                   = true
    viewer_protocol_policy     = "redirect-to-https"
  }

  restrictions {
    geo_restriction {
      restriction_type = "whitelist"
      locations        = ["CA"]
    }
  }

  viewer_certificate {
    acm_certificate_arn      = data.aws_acm_certificate.cmdb_cloudfront_certificate.arn
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method       = "sni-only"
  }

  tags = local.common_tags

  lifecycle {
    prevent_destroy = true
    # The BC Gov LZA attaches its central WAF (FMManagedWebACLV2-BCGOV-LZA-Live-Central-WAF-
    # cloudfront-*) through AWS Firewall Manager after creation. The platform team owns it, so
    # do not let Terraform detach it.
    ignore_changes = [web_acl_id]
  }
}
