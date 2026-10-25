resource "random_pet" "cmdb_subnet_group_name" {
  prefix = "cmdb-subnet-group"
  length = 2
}


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

resource "aws_db_subnet_group" "cmdb_subnet_group" {
  description = "For Aurora cluster ${var.cmdb_cluster_name}"
  name        = "${var.cmdb_cluster_name}-subnet-group"
  subnet_ids  = data.aws_subnets.app.ids
  tags = {
    managed-by = "terraform"
  }

  tags_all = {
    managed-by = "terraform"
  }
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
  allocated_storage    = 10

  # Needed for Terraform to apply a major version change. It only permits the
  # upgrade; the upgrade itself happens when postgres_engine_version changes.
  allow_major_version_upgrade = true

  db_name  = var.application
  username = var.cmdb_master_username
  password = random_password.cmdb_master_password.result
  port     = "5432"

  # Module v6 defaults this to true, which ignores `password` and has RDS create
  # its own Secrets Manager secret that auto-rotates every 7 days.
  manage_master_user_password = false

  vpc_security_group_ids = [data.aws_security_group.data.id]

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # Automated backups with point-in-time restore for the last 7 days.
  backup_retention_period = 7

  # Apply changes during terraform apply instead of the next maintenance window.
  apply_immediately = true

  # Enhanced Monitoring - see example for details on how to create the role
  # by yourself, in case you don't want to create it automatically
  monitoring_interval    = "30"
  monitoring_role_name   = "MyRDSMonitoringRole"
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

resource "aws_db_parameter_group" "cmdb_postgresql13" {
  name        = "${var.cmdb_cluster_name}-parameter-group"
  family      = "postgres13"
  description = "${var.cmdb_cluster_name}-parameter-group"
  tags = {
    managed-by = "terraform"
  }
}

resource "aws_rds_cluster_parameter_group" "cmdb_postgresql13" {
  name        = "${var.cmdb_cluster_name}-cluster-parameter-group"
  family      = "postgres13"
  description = "${var.cmdb_cluster_name}-cluster-parameter-group"
  tags = {
    managed-by = "terraform"
  }
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

resource "random_password" "cmdb_api_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

variable "cmdb_api_username" {
  description = "The username for the DB api user"
  type        = string
  default     = "fam_proxy_api"
  sensitive   = true
}


resource "random_pet" "api_creds_secret_name" {
  prefix = "cmdb-api-creds"
  length = 2
}

resource "aws_secretsmanager_secret" "cmdb_apicreds_secret" {
  name = random_pet.api_creds_secret_name.id

  tags = {
    managed-by = "terraform"
  }
}

resource "aws_secretsmanager_secret_version" "cmdb_apicreds_secret_version" {
  secret_id     = aws_secretsmanager_secret.cmdb_apicreds_secret.id
  secret_string = <<EOF
   {
    "username": "${var.cmdb_api_username}",
    "password": "${random_password.cmdb_api_password.result}"
   }
  EOF
  lifecycle {
    ignore_changes = [secret_string]
  }
}
