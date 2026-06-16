data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
}

module "vpc" {
  source = "./modules/vpc"
}


module "iam" {
  source = "./modules/iam"
}

module "ec2" {
  source = "./modules/ec2"

  ami_id = data.aws_ami.amazon_linux.id

  instance_type = "t3.micro"

  subnet_id = module.vpc.public_subnet_id

  security_group_id = module.vpc.security_group_id

  instance_profile = module.iam.instance_profile_name
}