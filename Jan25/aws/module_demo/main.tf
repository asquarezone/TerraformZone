module "myvpc" {
  source       = "./modules/vpc"
  vpc_cidr     = "192.168.0.0/16"
  network_name = "vpc-module"
  private_subnets = [{
    name = "app"
    cidr = "192.168.0.0/24"
    az   = "ap-south-1a"
  }]
  public_subnets = [{
    name = "web"
    cidr = "192.168.1.0/24"
    az   = "ap-south-1a"
  }]

}

module "http_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.3.0"
  vpc_id = module.myvpc.vpc_id
  name = "web"
  ingress_with_cidr_blocks = [{
    from_port = 80
    to_port = 80
    protocol = "tcp"
    description = "open http"
    cidr_blocks = "0.0.0.0/0"
  }, {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    description = "open https"
    cidr_blocks = "0.0.0.0/0"
  }]
}

output "vpcid" {
  value = module.myvpc.vpc_id
}