# IAM module
module "iam" {
  source = "./modules/iam"

  asg_user  = "asg-user1"
  asg_group = "asg-group1"

}

# Launch Template module
module "lt" {
  source = "./modules/lt"

  iowner  = module.iam.instance_owner
  ami_id  = "ami-0eb9d6fc9fab44d24"
  itype   = "t2.micro"
  kpem    = "KP1"
}

# Auto Scaling Group module
module "asg" {
  source = "./modules/asg"

  lt_id = module.lt.launch_t1
}