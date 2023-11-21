#data "aws_acm_certificate" "cmdb_certificate" {
#  domain      = "cmdb${substr(var.target_env,0,1)}.hlth.gov.bc.ca"
#  statuses    = ["ISSUED"]
#  most_recent = true
#}

module "api_gateway" {
  source  = "terraform-aws-modules/apigateway-v2/aws"
  version = "2.2.2"

  name                   = "${var.application}-http-api"
  description            = "HTTP API Gateway"
  protocol_type          = "HTTP"
  create_api_domain_name = false

  #domain_name                              = "cmdb${substr(var.target_env,0,1)}.hlth.gov.bc.ca"
  #domain_name_certificate_arn              = data.aws_acm_certificate.cmdb_certificate.arn

  integrations = {
    "ANY /{proxy+}" = {
      connection_type    = "VPC_LINK"
      vpc_link           = "cmdb-vpc"
      integration_uri    = data.aws_alb_listener.front_end.arn
      integration_type   = "HTTP_PROXY"
      integration_method = "ANY"
    }
  }
  vpc_links = {
    cmdb-vpc = {
      name               = "${var.application}-vpc-link"
      security_group_ids = [data.aws_security_group.web.id]
      subnet_ids         = data.aws_subnets.web.ids
    }
  }
}
