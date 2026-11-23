# Backup secret can also be found at the Mid-Tier KeePass.
resource "aws_secretsmanager_secret" "pg_user" {
  name        = "CMDB_PG_USER"
  description = "Application database credential and connection details. Manual backup only; not read by Tomcat or Terraform."
}

resource "aws_secretsmanager_secret_version" "rds_credentials" {
  secret_id     = aws_secretsmanager_secret.pg_user.id
  secret_string = <<EOF
{
  "username": "postgres",
  "password": "changeme",
  "port": "${module.postgres_rds.db_instance_port}",
  "host": "${module.postgres_rds.db_instance_endpoint}",
  "db": "cmdb"
}
EOF
  lifecycle {
    ignore_changes = [secret_string]
  }
}
