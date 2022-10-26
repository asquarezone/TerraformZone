module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc-name
  cidr = var.vpc-cidr

  azs             = [format("%sa",var.region), format("%sb",var.region)]
  private_subnets = var.private-cidrs
  public_subnets  = var.public-cidrs

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}