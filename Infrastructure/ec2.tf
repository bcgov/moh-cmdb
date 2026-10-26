data "aws_ami" "linux" {
  owners = ["amazon"]
  # Pinned AMI is deprecated by Amazon 90 days after release, keep resolving it after that.
  include_deprecated = true
  filter {
    name   = "name"
    values = ["al2023-ami-2023.12.20260930.0-kernel-6.1-x86_64"]
  }
}

locals {
  # CMDBuild's URL path and config folder name: cmdbuildTest in test, cmdbuildProd in prod.
  cmdbuild_webapp = "cmdbuild${title(var.target_env)}"
}

resource "aws_instance" "cmdb" {
  ami                    = data.aws_ami.linux.id
  instance_type          = "t2.large"
  subnet_id              = values(data.aws_subnet.app)[0].id
  vpc_security_group_ids = [data.aws_security_group.app.id]
  iam_instance_profile   = aws_iam_instance_profile.cmdb_ec2.name
  user_data = templatefile("user_data.sh", {
    region          = var.aws_region
    bucket          = aws_s3_bucket.tomcat.bucket
    tomcat_version  = var.tomcat_version
    cmdbuild_war    = var.cmdbuild_war_file
    cmdbuild_webapp = local.cmdbuild_webapp
  })

  ebs_block_device {
    device_name           = "/dev/xvda"
    delete_on_termination = true
    encrypted             = true
  }
  tags = {
    "Name" = "${var.application}-${var.target_env}"
    # Picked up by the daily snapshot policy in snapshots.tf
    "SnapshotPolicy" = "${var.application}-${var.target_env}-daily"
  }

  lifecycle {
    # user_data.sh sets up Tomcat and CMDBuild at first boot, and CMDBuild's config
    # is then added by hand. 
    ignore_changes = [ami, user_data]
  }
}