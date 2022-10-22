module "vpc" {
    source = "terraform-aws-modules/vpc/aws"
    name = "ntier-vpc"
    cidr = "192.168.0.0/16"
    azs = ["us-west-2a", "us-west-2b" ]
    private_subnets = ["192.168.0.0/24", "192.168.1.0/24"]
    public_subnets = ["192.168.2.0/24", "192.168.3.0/24"]
    enable_nat_gateway = false
    enable_vpn_gateway = false
    tags = {
        Terraform = "true"
        Environment = "dev"
    }
  
}