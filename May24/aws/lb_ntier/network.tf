module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.network_info.name
  cidr = var.network_info.cidr

  azs             = var.network_info.azs
  private_subnets = var.network_info.private_subnets
  public_subnets  = var.network_info.public_subnets

  enable_nat_gateway = var.network_info.enable_nat_gateway
  enable_vpn_gateway = var.network_info.enable_vpn_gateway

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}


resource "aws_security_group" "web" {
  vpc_id = module.vpc.vpc_id
  name   = "web"
  ingress {
    from_port        = local.http
    to_port          = local.http
    protocol         = local.tcp
    cidr_blocks      = [local.any_ipv4]
    ipv6_cidr_blocks = [local.any_ipv6]
  }
  ingress {
    from_port        = local.ssh
    to_port          = local.ssh
    protocol         = local.tcp
    cidr_blocks      = [local.any_ipv4]
    ipv6_cidr_blocks = [local.any_ipv6]
  }
  egress {
    from_port        = local.start_port
    to_port          = local.start_port
    protocol         = local.any_protocol
    cidr_blocks      = [local.any_ipv4]
    ipv6_cidr_blocks = [local.any_ipv6]
  }
  tags = {
    Name = "ntier-Web"
  }

}