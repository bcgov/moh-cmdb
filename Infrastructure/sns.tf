resource "aws_sns_topic" "cmdb-sns" {
  name = "cmdb-topic"
}

resource "aws_sns_topic_subscription" "cmdb_alert_email" {
  for_each  = toset(var.alert_emails)
  topic_arn = aws_sns_topic.cmdb-sns.arn
  protocol  = "email"
  endpoint  = each.value
}

# This replaces the topic's default policy. The first statement keeps what the
# default allowed (this account, which is how the CloudWatch alarms publish); the
# second lets EventBridge publish patching failures from patching.tf.
data "aws_iam_policy_document" "cmdb_sns" {
  statement {
    sid = "AccountOwner"
    actions = [
      "SNS:GetTopicAttributes",
      "SNS:SetTopicAttributes",
      "SNS:AddPermission",
      "SNS:RemovePermission",
      "SNS:DeleteTopic",
      "SNS:Subscribe",
      "SNS:ListSubscriptionsByTopic",
      "SNS:Publish",
    ]
    resources = [aws_sns_topic.cmdb-sns.arn]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceOwner"
      values   = [data.aws_caller_identity.current.account_id]
    }
  }

  statement {
    sid       = "EventBridgePatchingFailures"
    actions   = ["SNS:Publish"]
    resources = [aws_sns_topic.cmdb-sns.arn]

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"]
    }

    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = [aws_cloudwatch_event_rule.patching_failed.arn]
    }
  }
}

resource "aws_sns_topic_policy" "cmdb-sns" {
  arn    = aws_sns_topic.cmdb-sns.arn
  policy = data.aws_iam_policy_document.cmdb_sns.json
}
