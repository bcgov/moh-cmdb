include {
  path = find_in_parent_folders()
}

generate "prod_tfvars" {
  path              = "prod.auto.tfvars"
  if_exists         = "overwrite"
  disable_signature = true
  contents          = <<-EOF
  app_port = 8080
  fam_console_idp_name = "PROD-IDIR"
  alb_origin_id = "cmdb.ynr9ed-prod.nimbus.cloud.gov.bc.ca"
  application_url = "cmdb.hlth.gov.bc.ca"
  EOF
}