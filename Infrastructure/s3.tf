resource "aws_s3_bucket" "tomcat" {
  bucket = "${data.aws_caller_identity.current.account_id}-tomcat"
}