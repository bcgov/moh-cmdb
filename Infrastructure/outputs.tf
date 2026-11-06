output "target_env" {
  description = "dev, test, or prod in AWS"
  value       = var.target_env
}

output "fam_console_idp_name" {
  description = "Identifies which version of IDIR to use (DEV, TEST, or PROD)"
  value       = var.fam_console_idp_name
}
output "cloudfront_domain_name" {
  description = "CloudFront domain (dxxxx.cloudfront.net) that the application_url DNS record must point to"
  value       = aws_cloudfront_distribution.cmdb_distribution.domain_name
}
