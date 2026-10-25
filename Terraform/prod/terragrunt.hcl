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
  alb_origin_id = "cmdb.hlth.gov.bc.ca"
  application_url = "cmdb.hlth.gov.bc.ca"
  # Stays on 13 until the data migration is done, then change to "17.11" to upgrade.
  postgres_engine_version = "13.23-rds.20260514"
  EOF
}