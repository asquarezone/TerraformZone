# create a vpc with 4 subnets
module "vpc" {
  source               = "terraform-aws-modules/vpc/aws"
  version              = "5.13.0"
  name                 = "ntier"
  cidr                 = "192.168.0.0/16"
  azs                  = ["ap-south-1a", "ap-south-1b"]
  private_subnets      = ["192.168.2.0/24", "192.168.3.0/24"]
  public_subnets       = ["192.168.0.0/24", "192.168.1.0/24"]
  enable_dns_hostnames = true
  enable_nat_gateway   = false
  enable_vpn_gateway   = false
  tags = {
    Environment = "dev"
    Project     = "learning"
  }
}


module "web_service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "web-sg"
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "http"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  depends_on = [module.vpc]
}

module "db_service_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "db-sg"
  description = "Security group for user-service with custom ports open within VPC, and PostgreSQL publicly open"
  vpc_id      = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      description = "ssh"
      cidr_blocks = module.vpc.vpc_cidr_block
    }
  ]
  depends_on = [module.vpc]
}

module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  instance_type          = "t2.micro"
  key_name               = "my_idrsa"
  monitoring             = true
  vpc_security_group_ids = [module.web_service_sg.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  ami                    = "ami-0522ab6e1ddcc7055"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}



