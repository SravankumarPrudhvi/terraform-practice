

module "vpc" {
  source = "git::https://github.com/SravankumarPrudhvi/terraform-practice.git//vpc"
  vpc_cidr = var.vpc_cidr
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
  env  = var.env
}

module "ec2" {
  source = "git::https://github.com/SravankumarPrudhvi/terraform-practice.git//ec2"
  ami_id  =var.ami_id
  instance_type = var.instance_type
  subnet_id  = module.vpc.public_subnet_ids[0]
  env  =var.env
}