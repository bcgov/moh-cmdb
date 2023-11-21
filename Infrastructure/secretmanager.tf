resource "aws_secretsmanager_secret" "pg_user" {
  name = "PG_USER"
}

resource "aws_secretsmanager_secret" "api_key" {
  name = "API_KEY_PRESIGNED_S3"
}

resource "aws_secretsmanager_secret" "api_url" {
  name = "API_URL_PRESIGNED_S3"
}

resource "aws_secretsmanager_secret" "jms_user" {
  name = "JMS_BROKER_USERNAME"
}

resource "aws_secretsmanager_secret" "jms_pass" {
  name = "JMS_BROKER_PASSWORD"
}

resource "aws_secretsmanager_secret_version" "rds_credentials" {
  secret_id     = aws_secretsmanager_secret.pg_user.id
  secret_string = <<EOF
{
  "username": "deathdate_proxy_user",
  "password": "changeme"
}
EOF
  lifecycle {
    ignore_changes = [secret_string]
  }
}

resource "aws_secretsmanager_secret_version" "api_key" {
  secret_id     = aws_secretsmanager_secret.api_key.id
  secret_string = "changeme"
}
resource "aws_secretsmanager_secret_version" "api_url" {
  secret_id     = aws_secretsmanager_secret.api_url.id
  secret_string = aws_api_gateway_stage.dd-filedrop-stage.invoke_url
}

resource "aws_secretsmanager_secret_version" "jms_user" {
  secret_id     = aws_secretsmanager_secret.jms_user.id
  secret_string = "changeme"
}

resource "aws_secretsmanager_secret_version" "jms_pass" {
  secret_id     = aws_secretsmanager_secret.jms_pass.id
  secret_string = "changeme"
}
