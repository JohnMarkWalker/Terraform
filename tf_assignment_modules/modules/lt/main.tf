data "aws_security_group" "lw-1" {
  filter {
    name = "group-name"
    values = [ "launch-wizard-1" ]
  }
}

resource "aws_launch_template" "lt_asg" {
  image_id = var.ami_id
  instance_type = var.itype
  key_name = var.kpem
  vpc_security_group_ids = [ data.aws_security_group.lw-1.id ]

  tags = {
    instance_owner = var.iowner
  }
}