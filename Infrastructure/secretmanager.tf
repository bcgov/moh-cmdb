resource "aws_secretsmanager_secret" "pg_user" {
  name = "PG_USER"
}

resource "aws_secretsmanager_secret" "pg_url" {
  name = "PG_URL"
}

resource "aws_secretsmanager_secret_version" "pg_url" {
  secret_id     = aws_secretsmanager_secret.pg_url.id
  secret_string = "changeme"
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
