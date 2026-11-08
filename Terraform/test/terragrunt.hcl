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
  patch_approve_after_days = 7
  # Scan only (no installs, no reboots) until the patching setup has been checked on the
  # test server. Then remove this line so test installs patches nightly.
  patch_operation = "Scan"
  # Receives patching-failure emails and CloudWatch alarms. Temporary; replace with the
  # Mid-tier address. Each address must confirm the SNS subscription email.
  alert_emails = ["ian.1.liu@gov.bc.ca"]
  EOF
}