module "vpc" {
  source = "../modules/vpc"
  network_info = {
    name = "ntier-primary"
    cidr = "10.0.0.0/16"
  }
  public_subnets = [{
    name = "web-1"
    az   = "ap-south-1a"
    cidr = "10.0.0.0/24"
  }]
  private_subnets = [{
    name = "db-1"
    az   = "ap-south-1a"
    cidr = "10.0.50.0/24"
    }, {
    name = "db-2"
    az   = "ap-south-1b"
    cidr = "10.0.51.0/24"
  }]
}

# create web security group
module "web_security_group" {
  source = "../modules/security_group"
  security_group_info = {
    name        = "web-sg"
    description = "web security group"
    vpc_id      = module.vpc.vpcid
    inbound_rules = [{
      cidr        = "0.0.0.0/0"
      port        = 22
      protocol    = "tcp"
      description = "open ssh"
      },
      {
        cidr        = "0.0.0.0/0"
        port        = 80
        protocol    = "tcp"
        description = "open http"
      }
    ]
    outbound_rules   = []
    allow_all_egress = true
  }

  depends_on = [module.vpc]

}

# create a db security group to open 3306 port with in vpc
module "db_security_group" {
  source = "../modules/security_group"
  security_group_info = {
    name             = "mysql-db-sg"
    description      = "open mysql port within vpc"
    vpc_id           = module.vpc.vpcid
    allow_all_egress = true
    outbound_rules   = []
    inbound_rules = [{
      cidr        = "10.0.0.0/16"
      port        = 3306
      protocol    = "tcp"
      description = "open mysql port"
    }]
  }
}