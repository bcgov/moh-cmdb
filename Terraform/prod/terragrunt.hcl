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

  # Upgraded from 13.23-rds.20260514 to 17.11 (major version upgrade).
  postgres_engine_version = "17.11"
  db_allocated_storage = 20

  # RDS changes wait for the maintenance window (Mon:00:00-Mon:03:00, UTC) instead of being
  # applied during terraform apply. To apply one straight away, set this to true for that apply.
  db_apply_immediately = false

  # Java heap, same as the ASEA PROD server (2 GB at start, 4 GB maximum). Written to
  # bin/setenv.sh at first boot only, so it is ready before the instance is created.
  catalina_opts = "-Xms2048m -Xmx4096m"

  # Prod installs each patch a week after test does. Bugfixes wait 14 days; Critical and
  # Important security updates wait 7.
  patch_approve_after_days          = 14
  patch_security_approve_after_days = 7

  # Prod installs patches nightly (the variable's default is "Install"). CMDBuild answers on
  # /cmdbuildProd/ since the LZA cutover. To go back to report-only (no installs, no
  # reboots), add: patch_operation = "Scan"

  # Receives patching-failure emails and CloudWatch alarms. Each address must confirm the
  # SNS subscription email.
  alert_emails = ["Mid-tier.vic@cgi.com"]

  EOF
}