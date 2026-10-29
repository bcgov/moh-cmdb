include {
  path = find_in_parent_folders()
}

generate "test_tfvars" {
  path              = "test.auto.tfvars"
  if_exists         = "overwrite"
  disable_signature = true
  contents          = <<-EOF
  app_port = 8080
  fam_console_idp_name = "TEST-IDIR"
  alb_origin_id = "cmdbt.hlth.gov.bc.ca"
  application_url = "cmdbt.hlth.gov.bc.ca"
  # ALB listener rule priorities; the redirect must be lower than the forward rule.
  root_redirect_priority = 10
  app_forward_priority = 20
  # Stays on 13.23-rds.20260514 until the data migration is done, then change to "17.11" to upgrade.
  postgres_engine_version = "17.11"
  EOF
}