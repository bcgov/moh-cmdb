data "aws_ami" "linux" {
    most_recent = true

    filter {
      name = "name"
      values = ["al2023-ami-2023.3.20240131.0-kernel-6.1-x86_64"]
    }
}


resource "aws_instance" "cmdb" {
  ami = data.aws_ami.linux.id
  instance_type = "t2.large"
  subnet_id = values(data.aws_subnet.app)[0].id
  vpc_security_group_ids = [data.aws_security_group.app.id]
  iam_instance_profile = "SSM_S3_Access_Role"
  user_data = file("user_data.sh")

  ebs_block_device {
    device_name = "/dev/xvda"
    delete_on_termination = true
    encrypted = true
  }
  tags = {
    "Name" = "${var.application}-${var.target_env}"
  }
}