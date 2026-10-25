# Nightly OS patching for the CMDB EC2 instance with Systems Manager Patch Manager.
#
# Every night at 02:00 Vancouver time, AWS-RunPatchBaselineWithHooks:
#   1. scans for missing patches (with patch_operation = "Scan" it stops here),
#   2. runs the pre-patch hook: requires tonight's EBS snapshot from snapshots.tf,
#      then stops Tomcat. If the hook fails, nothing is installed or rebooted,
#   3. installs the approved patches,
#   4. reboots if anything was installed (Tomcat starts again on boot),
#   5. runs the post-patch hook: starts Tomcat if needed and checks CMDB answers.
# Steps 2-4 are skipped on nights with nothing to install. A failed run is emailed
# through cmdb-topic (sns.tf).

locals {
  patch_group = "${var.application}-${var.target_env}"

  # Name tag that snapshots.tf puts on the nightly snapshots.
  ec2_snapshot_name = "${var.application}-${var.target_env}-daily"

  # The snapshot starts within an hour of 07:00 UTC and patching at 02:00 Vancouver
  # (09:00 or 10:00 UTC), so tonight's snapshot is 1-3 hours old and last night's
  # is over 24. Anything older than this means tonight's snapshot is missing.
  max_snapshot_age_hours = 12
}

# Same rules as AWS-AmazonLinux2023DefaultPatchBaseline (Critical and Important
# security updates, plus all bugfixes), with the delay set per environment.
resource "aws_ssm_patch_baseline" "cmdb_al2023" {
  name             = "${var.application}-${var.target_env}-al2023"
  description      = "CMDB AL2023: Critical and Important security updates plus bugfixes"
  operating_system = "AMAZON_LINUX_2023"

  approval_rule {
    approve_after_days = var.patch_approve_after_days
    compliance_level   = "HIGH"

    patch_filter {
      key    = "CLASSIFICATION"
      values = ["Security"]
    }

    patch_filter {
      key    = "SEVERITY"
      values = ["Critical", "Important"]
    }
  }

  approval_rule {
    approve_after_days = var.patch_approve_after_days
    compliance_level   = "MEDIUM"

    patch_filter {
      key    = "CLASSIFICATION"
      values = ["Bugfix"]
    }
  }

  tags = local.common_tags
}

# Instances tagged PatchGroup = cmdb-<env> (ec2.tf) use the baseline above.
resource "aws_ssm_patch_group" "cmdb" {
  baseline_id = aws_ssm_patch_baseline.cmdb_al2023.id
  patch_group = local.patch_group
}

resource "aws_ssm_maintenance_window" "cmdb_patching" {
  name              = "${var.application}-${var.target_env}-nightly-patching"
  description       = "Nightly OS patching for the CMDB EC2 instance"
  schedule          = var.patch_window_schedule
  schedule_timezone = "America/Vancouver"
  duration          = 2
  cutoff            = 1

  tags = local.common_tags
}

resource "aws_ssm_maintenance_window_target" "cmdb_ec2" {
  window_id     = aws_ssm_maintenance_window.cmdb_patching.id
  name          = "${var.application}-${var.target_env}-ec2"
  resource_type = "INSTANCE"

  targets {
    key    = "InstanceIds"
    values = [aws_instance.cmdb.id]
  }
}

resource "aws_cloudwatch_log_group" "patching" {
  name              = "/cmdb/${var.target_env}/patching"
  retention_in_days = 30
  tags              = local.common_tags
}

resource "aws_ssm_document" "pre_patch" {
  name            = "${var.application}-${var.target_env}-pre-patch"
  document_type   = "Command"
  document_format = "YAML"

  content = yamlencode({
    schemaVersion = "2.2"
    description   = "CMDB pre-patch hook: require tonight's EBS snapshot, then stop Tomcat"
    mainSteps = [{
      action = "aws:runShellScript"
      name   = "prePatch"
      inputs = {
        timeoutSeconds = "300"
        runCommand = [templatefile("patching/pre-patch.sh", {
          region                 = var.aws_region
          snapshot_name          = local.ec2_snapshot_name
          max_snapshot_age_hours = local.max_snapshot_age_hours
          tomcat_service         = var.tomcat_service_name
        })]
      }
    }]
  })

  tags = local.common_tags
}

resource "aws_ssm_document" "post_patch" {
  name            = "${var.application}-${var.target_env}-post-patch"
  document_type   = "Command"
  document_format = "YAML"

  content = yamlencode({
    schemaVersion = "2.2"
    description   = "CMDB post-patch hook: start Tomcat if needed and check CMDB answers"
    mainSteps = [{
      action = "aws:runShellScript"
      name   = "postPatch"
      inputs = {
        timeoutSeconds = "900"
        runCommand = [templatefile("patching/post-patch.sh", {
          tomcat_service    = var.tomcat_service_name
          app_port          = var.app_port
          health_check_path = var.health_check_path
        })]
      }
    }]
  })

  tags = local.common_tags
}

resource "aws_ssm_maintenance_window_task" "patch" {
  window_id        = aws_ssm_maintenance_window.cmdb_patching.id
  name             = "nightly-patch"
  description      = "Snapshot check, install approved patches, reboot if needed, CMDB health check"
  task_type        = "RUN_COMMAND"
  task_arn         = "AWS-RunPatchBaselineWithHooks"
  service_role_arn = aws_iam_role.cmdb_patching_window.arn
  priority         = 1
  max_concurrency  = "1"
  max_errors       = "1"

  targets {
    key    = "WindowTargetIds"
    values = [aws_ssm_maintenance_window_target.cmdb_ec2.id]
  }

  task_invocation_parameters {
    run_command_parameters {
      parameter {
        name   = "Operation"
        values = [var.patch_operation]
      }

      parameter {
        name   = "RebootOption"
        values = ["RebootIfNeeded"]
      }

      parameter {
        name   = "PreInstallHookDocName"
        values = [aws_ssm_document.pre_patch.name]
      }

      parameter {
        name   = "OnExitHookDocName"
        values = [aws_ssm_document.post_patch.name]
      }

      cloudwatch_config {
        cloudwatch_log_group_name = aws_cloudwatch_log_group.patching.name
        cloudwatch_output_enabled = true
      }
    }
  }
}

# Email the team when a patch run on this instance fails, times out or is cancelled.
# The topic policy that lets EventBridge publish is in sns.tf.
resource "aws_cloudwatch_event_rule" "patching_failed" {
  name        = "${var.application}-${var.target_env}-patching-failed"
  description = "CMDB nightly patch run failed, timed out or was cancelled"

  event_pattern = jsonencode({
    "source"      = ["aws.ssm"]
    "detail-type" = ["EC2 Command Invocation Status-change Notification"]
    "detail" = {
      "document-name" = ["AWS-RunPatchBaselineWithHooks"]
      "instance-id"   = [aws_instance.cmdb.id]
      "status"        = ["Failed", "TimedOut", "Cancelled"]
    }
  })

  tags = local.common_tags
}

resource "aws_cloudwatch_event_target" "patching_failed_email" {
  rule = aws_cloudwatch_event_rule.patching_failed.name
  arn  = aws_sns_topic.cmdb-sns.arn

  input_transformer {
    input_paths = {
      command  = "$.detail.command-id"
      instance = "$.detail.instance-id"
      status   = "$.detail.status"
      time     = "$.time"
    }
    input_template = "\"CMDB ${var.target_env} nightly patching ended with status <status> on <instance> at <time> UTC (command <command>). The output is in the CloudWatch Logs group ${aws_cloudwatch_log_group.patching.name}.\""
  }
}
