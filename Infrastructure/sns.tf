resource "aws_sns_topic" "cmdb-sns" {
  name = "cmdb-topic"
}
resource "aws_sns_topic_subscription" "cmdb_alert_email" {
  for_each  = toset(var.alert_emails)
  topic_arn = aws_sns_topic.cmdb-sns.arn
  protocol  = "email"
  endpoint  = each.value
}