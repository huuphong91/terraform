provider "aws" {
  region = "ap-east-1"
}

module "vpc" {
  source = "./modules/vpc"
  name               = var.name
  cidr               = var.cidr
  azs                = var.azs
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets
  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway
}

module "ec2_public" {
  source = "./modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id    = module.vpc.public_subnets[0]
  key_name      = var.key_name
  count_ec2     = 1
  count_eip = 1
}

module "ec2_private_1" {
  source = "./modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id    = module.vpc.private_subnets[0]
  count_ec2    = 1
  key_name     = var.key_name
  count_eip = 0
}

module "ec2_private_2" {
  source = "./modules/ec2"
  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id    = module.vpc.private_subnets[1]
  count_ec2    = 1
  key_name     = var.key_name
  count_eip = 0
}
