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
  alb_origin_id = "cmdb.ynr9ed-test.nimbus.cloud.gov.bc.ca"
  application_url = "cmdbt.hlth.gov.bc.ca"
  EOF
}