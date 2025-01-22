module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_info.name
  cidr = var.vpc_info.cidr

  azs             = var.vpc_info.azs
  private_subnets = var.vpc_info.private_subnets_cidr
  public_subnets  = var.vpc_info.public_subnets_cidr

  enable_nat_gateway = var.vpc_info.enable_nat_gateway
  enable_vpn_gateway = var.vpc_info.enable_vpn_gateway

  tags = var.vpc_info.tags
}