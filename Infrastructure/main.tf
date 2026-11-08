terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      # 6.42+
      version = ">= 6.42, < 7"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3"
    }
  }
  required_version = ">= 1.11" # S3 backend use_lockfile (native state locking)
}

locals {
  common_tags = var.common_tags
}

data "aws_caller_identity" "current" {}