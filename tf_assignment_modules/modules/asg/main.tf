data "aws_subnet" "subnet1" {
    filter {
        name = "tag:Name"
        values = [ "Network-test-subnet-public2-us-east-2b" ]
    }
}

data "aws_subnet" "subnet2" {
    filter {
        name = "tag:Name"
        values = [ "Network-test-subnet-public1-us-east-2a" ]
    }
}

resource "aws_autoscaling_group" "auto_scaler" {
  max_size = 4
  min_size = 2
  desired_capacity = 2
  name = "assignment-asg-test"
  vpc_zone_identifier = [ data.aws_subnet.subnet1.id, data.aws_subnet.subnet2.id ]

  launch_template {
    id = var.lt_id
    version = "$Latest"
  }
}