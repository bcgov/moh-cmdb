include {
  path = find_in_parent_folders()
}

generate "prod_tfvars" {
  path              = "prod.auto.tfvars"
  if_exists         = "overwrite"
  disable_signature = true
  contents          = <<-EOF
  app_port             = 8080
  fam_console_idp_name = "PROD-IDIR"
  alb_origin_id        = "cmdb.hlth.gov.bc.ca"
  application_url      = "cmdb.hlth.gov.bc.ca"

  # ALB listener rule priorities; the redirect must be lower than the forward rule.
  root_redirect_priority = 10
  app_forward_priority   = 20

  # Stays on 13 until the data migration is done, then change to "17.11" to upgrade.
  postgres_engine_version = "13.23-rds.20260514"
  db_allocated_storage = 20

  # Prod installs each patch a week after test does. Bugfixes wait 14 days; Critical and
  # Important security updates wait 7.
  patch_approve_after_days          = 14
  patch_security_approve_after_days = 7

  # Scan only (no installs, no reboots) until CMDBuild is deployed and answers on
  # /cmdbuildProd/; the post-patch health check would fail every night before that.
  # Then remove this line so prod installs patches nightly.
  patch_operation = "Scan"

  # Receives patching-failure emails and CloudWatch alarms. Temporary; replace with the
  # Mid-tier address. Each address must confirm the SNS subscription email.
  alert_emails = ["ian.1.liu@gov.bc.ca"]

  EOF
}