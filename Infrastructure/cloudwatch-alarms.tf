resource "aws_sns_topic" "alerts" {
  name = "cloudwatch_alarms"
}


##########################################
###### CloudWatch Alarm for RDS ##########
##########################################

resource "aws_cloudwatch_metric_alarm" "rds_cpu_utilization" {
  alarm_name          = "rds-cpu-utilization-${var.application}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "3"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = "60"
  statistic           = "Average"
  threshold           = "70"
  alarm_description   = "Alarm when RDS CPU utilization exceeds 70%"

  alarm_actions = [
    aws_sns_topic.alerts.arn
  ]

  dimensions = {
    DBInstanceIdentifier = module.postgres_rds.db_instance_identifier
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_db_connections" {
  alarm_name          = "rds-db-connections-${var.application}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "DatabaseConnections"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Average"
  threshold           = 100
  alarm_description   = "Alarm when the number of database connections exceeds 100 for 2 consecutive periods"

  alarm_actions = [
    aws_sns_topic.alerts.arn
  ]

  dimensions = {
    DBInstanceIdentifier = module.postgres_rds.db_instance_identifier
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_disk_queue_depth" {
  alarm_name          = "rds-disk-queue-depth-${var.application}"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "DiskQueueDepth"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Maximum"
  threshold           = 10
  alarm_description   = "Alarm when the disk queue depth (IOPS requests waiting to be serviced) exceeds 10 for 2 consecutive periods"
  alarm_actions = [
    aws_sns_topic.alerts.arn
  ]

  dimensions = {
    DBInstanceIdentifier = module.postgres_rds.db_instance_identifier
  }
}

resource "aws_cloudwatch_metric_alarm" "rds_free_storage_space" {
  alarm_name          = "rds-free-storage-space-${var.application}"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 1
  metric_name         = "FreeStorageSpace"
  namespace           = "AWS/RDS"
  period              = 300
  statistic           = "Minimum"
  threshold           = 2147483648 # 2 GiB in bytes (20% of the 10 GiB allocated)
  alarm_description   = "Alarm when RDS free storage space drops below 2 GiB"

  alarm_actions = [
    aws_sns_topic.alerts.arn
  ]

  dimensions = {
    DBInstanceIdentifier = module.postgres_rds.db_instance_identifier
  }
}


##########################################
###### CloudWatch Alarm for EC2 ##########
##########################################

resource "aws_cloudwatch_metric_alarm" "ec2_cpu_utilization" {
  alarm_name          = "ec2-cpu-utilization-${var.application}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300 # basic monitoring publishes every 5 minutes
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Alarm when EC2 CPU utilization is at or above 80% for 10 minutes"

  alarm_actions = [
    aws_sns_topic.alerts.arn
  ]

  dimensions = {
    InstanceId = aws_instance.cmdb.id
  }
}

resource "aws_cloudwatch_metric_alarm" "ec2_status_check_failed" {
  alarm_name          = "ec2-status-check-failed-${var.application}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "StatusCheckFailed"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Maximum"
  threshold           = 1
  alarm_description   = "Alarm when the EC2 instance or system status check fails for 2 consecutive minutes"

  alarm_actions = [
    aws_sns_topic.alerts.arn
  ]

  dimensions = {
    InstanceId = aws_instance.cmdb.id
  }
}


##########################################
###### CloudWatch Alarm for ALB ##########
##########################################

resource "aws_cloudwatch_metric_alarm" "alb_unhealthy_hosts" {
  alarm_name          = "alb-unhealthy-hosts-${var.application}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = 60
  statistic           = "Maximum"
  threshold           = 1
  alarm_description   = "Alarm when any target in the app target group is unhealthy for 2 consecutive minutes"

  alarm_actions = [
    aws_sns_topic.alerts.arn
  ]

  dimensions = {
    TargetGroup  = aws_alb_target_group.app.arn_suffix
    LoadBalancer = data.aws_alb.main.arn_suffix
  }
}
