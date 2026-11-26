resource "random_password" "cmdb_master_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

variable "cmdb_master_username" {
  description = "The username for the DB master user"
  type        = string
  default     = "postgres"
  sensitive   = true
}

variable "cmdb_database_name" {
  description = "The name of the database"
  type        = string
  default     = "cmdb"
}

locals {
  # var.postgres_engine_version is set per environment in Terraform/<env>/terragrunt.hcl.
  # The parameter group family follows its major version, so on a major upgrade the
  # module creates the new family's parameter group first, upgrades the instance onto
  # it in the same change, and then deletes the old group.
  postgres_major_version = split(".", var.postgres_engine_version)[0]
}

module "postgres_rds" {
  source               = "terraform-aws-modules/rds/aws"
  version              = "~> 6.0"
  identifier           = "${var.application}-${var.target_env}"
  major_engine_version = local.postgres_major_version
  family               = "postgres${local.postgres_major_version}"
  engine               = "postgres"
  engine_version       = var.postgres_engine_version
  instance_class       = "db.t3.micro"
  allocated_storage    = var.db_allocated_storage

  # Off, so an accidental edit to a different major version fails instead of upgrading.
  # For a planned major upgrade (for example PG17 to 18), set this to true for that apply only,
  # then back to false. The upgrade itself happens when postgres_engine_version changes.
  allow_major_version_upgrade = false

  db_name  = var.application
  username = var.cmdb_master_username
  password = random_password.cmdb_master_password.result
  port     = "5432"

  # Module v6 defaults this to true, which ignores `password` set this to false to avoid that
  manage_master_user_password = false

  vpc_security_group_ids = [data.aws_security_group.data.id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Automated backups with point-in-time restore for the last 7 days.
  backup_retention_period = 7

  # true: apply changes during terraform apply. false: wait for the next maintenance window.
  # Set per environment with db_apply_immediately.
  apply_immediately = var.db_apply_immediately

  # Enhanced Monitoring for rds
  monitoring_interval    = "30"
  monitoring_role_name   = "${var.application}-${var.target_env}-rds-monitoring"
  create_monitoring_role = true

  tags = {
    CreatedBy = "terraform"
  }

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = data.aws_subnets.data.ids


  # Database Deletion Protection
  #deletion_protection = true
}

resource "random_pet" "master_creds_secret_name" {
  prefix = "cmdb-master-creds"
  length = 2
}

resource "aws_secretsmanager_secret" "cmdb_mastercreds_secret" {
  name = random_pet.master_creds_secret_name.id

  tags = {
    managed-by = "terraform"
  }
}

resource "aws_secretsmanager_secret_version" "cmdb_mastercreds_secret_version" {
  secret_id     = aws_secretsmanager_secret.cmdb_mastercreds_secret.id
  secret_string = <<EOF
   {
    "username": "${var.cmdb_master_username}",
    "password": "${random_password.cmdb_master_password.result}"
   }
  EOF
  lifecycle {
    ignore_changes = [secret_string]
  }
}
