data "aws_ami" "linux" {
  owners = ["amazon"]
  # Pinned AMI is deprecated by Amazon 90 days after release; keep resolving it after that.
  include_deprecated = true
  filter {
    name   = "name"
    values = ["al2023-ami-2023.12.20260930.0-kernel-6.1-x86_64"]
  }
}


resource "aws_instance" "cmdb" {
  ami                    = data.aws_ami.linux.id
  instance_type          = "t2.large"
  subnet_id              = values(data.aws_subnet.app)[0].id
  vpc_security_group_ids = [data.aws_security_group.app.id]
  iam_instance_profile   = aws_iam_instance_profile.cmdb_ec2.name
  user_data              = file("user_data.sh")

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
    # The app is installed by hand on this box; without this a new AL2023 AMI
    # release would replace the instance and wipe it.
    ignore_changes = [ami, user_data]
  }
}