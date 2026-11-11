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

  # Upgraded from 13.23-rds.20260514 to 17.11 (major version upgrade).
  postgres_engine_version = "17.11"

  patch_approve_after_days = 7
  # Test installs patches nightly (the variable's default is "Install"). To go back to
  # report-only (no installs, no reboots), add: patch_operation = "Scan"

  # Receives patching-failure emails and CloudWatch alarms. Temporary; replace with the
  # Mid-tier address. Each address must confirm the SNS subscription email.
  alert_emails = ["ian.1.liu@gov.bc.ca"]
  EOF
}