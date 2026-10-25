data "aws_iam_policy_document" "instance_assume_ecstask_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "ec2_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_policy" "get_secret" {
  name = "CMDB_ECS_GetSecret"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Sid" : "VisualEditor0",
          "Effect" : "Allow",
          "Action" : "secretsmanager:GetSecretValue",
          "Resource" : "*"
        }
      ]
    }
  )
}

# ECS task execution role
resource "aws_iam_role" "ecs_task_execution_role" {
  name               = var.ecs_task_execution_role_name
  assume_role_policy = data.aws_iam_policy_document.instance_assume_ecstask_role_policy.json

  #tags = local.common_tags
}

# ECS task execution role policy attachment
resource "aws_iam_role_policy_attachment" "ecs_task_execution_role" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"

}

# GetSecret role policy attachment
resource "aws_iam_role_policy_attachment" "secret_role" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = aws_iam_policy.get_secret.arn

}

# EC2 instance role: Session Manager access and read access to the tomcat bucket
resource "aws_iam_role" "cmdb_ec2" {
  name               = "${var.application}-${var.target_env}-ec2-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "cmdb_ec2_ssm" {
  role       = aws_iam_role.cmdb_ec2.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy" "cmdb_ec2_tomcat_bucket" {
  name = "tomcat-bucket-read"
  role = aws_iam_role.cmdb_ec2.id

  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : "s3:ListBucket",
          "Resource" : aws_s3_bucket.tomcat.arn
        },
        {
          "Effect" : "Allow",
          "Action" : "s3:GetObject",
          "Resource" : "${aws_s3_bucket.tomcat.arn}/*"
        }
      ]
    }
  )
}

resource "aws_iam_instance_profile" "cmdb_ec2" {
  name = "${var.application}-${var.target_env}-ec2-profile"
  role = aws_iam_role.cmdb_ec2.name
}

data "aws_iam_policy_document" "dlm_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["dlm.amazonaws.com"]
    }
  }
}

# Data Lifecycle Manager role: create and expire the EC2 instance's daily EBS snapshots
resource "aws_iam_role" "cmdb_dlm" {
  name               = "${var.application}-${var.target_env}-dlm-role"
  assume_role_policy = data.aws_iam_policy_document.dlm_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "cmdb_dlm" {
  role       = aws_iam_role.cmdb_dlm.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSDataLifecycleManagerServiceRole"
}

# The root volume is encrypted, so DLM needs the volume's KMS key. Scoped to calls
# made through EC2/EBS so it works with either aws/ebs or a landing zone key.
resource "aws_iam_role_policy" "cmdb_dlm_kms" {
  name = "ebs-snapshot-kms"
  role = aws_iam_role.cmdb_dlm.id

  policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Action" : [
            "kms:CreateGrant",
            "kms:Encrypt",
            "kms:Decrypt",
            "kms:ReEncrypt*",
            "kms:GenerateDataKey*",
            "kms:DescribeKey"
          ],
          "Resource" : "*",
          "Condition" : {
            "StringEquals" : {
              "kms:ViaService" : "ec2.${var.aws_region}.amazonaws.com"
            }
          }
        }
      ]
    }
  )
}
