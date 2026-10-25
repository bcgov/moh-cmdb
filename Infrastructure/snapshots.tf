# Daily EBS snapshots of the CMDB EC2 instance with Data Lifecycle Manager.
# Snapshots every volume attached to instances tagged SnapshotPolicy (see ec2.tf)
# as one crash-consistent set, and deletes the oldest once the retention count
# is reached. Snapshots are kept even if the instance is terminated.

resource "aws_dlm_lifecycle_policy" "cmdb_ec2" {
  description        = "${var.application}-${var.target_env} daily EC2 snapshots"
  execution_role_arn = aws_iam_role.cmdb_dlm.arn
  state              = "ENABLED"

  policy_details {
    policy_type    = "EBS_SNAPSHOT_MANAGEMENT"
    resource_types = ["INSTANCE"]

    target_tags = {
      SnapshotPolicy = "${var.application}-${var.target_env}-daily"
    }

    schedule {
      name      = "daily"
      copy_tags = true

      # DLM schedules are UTC only and start within an hour of this time.
      # 07:00 UTC is midnight in Vancouver during PDT and 23:00 during PST.
      create_rule {
        interval      = 24
        interval_unit = "HOURS"
        times         = ["07:00"]
      }

      retain_rule {
        count = var.ec2_snapshot_retention_count
      }

      tags_to_add = {
        Name = "${var.application}-${var.target_env}-daily"
      }
    }
  }

  # DLM policies have no name attribute; the console shows the Name tag instead.
  tags = merge(local.common_tags, {
    Name = "${var.application}-${var.target_env}"
  })
}
