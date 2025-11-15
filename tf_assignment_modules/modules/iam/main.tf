resource "aws_iam_user" "asg_user1" {
  name = var.asg_user
}

resource "aws_iam_group" "asg_group1" {
  name = var.asg_group
}

resource "aws_iam_user_group_membership" "user_group_add" {
  user   = aws_iam_user.asg_user1.name
  groups = [aws_iam_group.asg_group1.name]
}