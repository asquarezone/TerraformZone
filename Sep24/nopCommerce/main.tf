# vpc with two public and two private subnets

module "vpc" {
  source = "git::https://github.com/asquarezone/LTTerraformModules.git//aws/vpc"
  vpc_info = {
    cidr_block           = "192.168.0.0/16"
    enable_dns_hostnames = true
    tags = {
      Name        = "nop-vpc"
      Purpose     = "nop"
      Environment = "Dev"
    }
  }
  public_subnets = [{
    cidr_block = "192.168.0.0/24"
    az         = "ap-south-1a"
    tags = {
      Name = "web-1"
    }
    }, {
    cidr_block = "192.168.1.0/24"
    az         = "ap-south-1b"
    tags = {
      Name = "web-2"
    }
    }
  ]
  private_subnets = [{
    cidr_block = "192.168.2.0/24"
    az         = "ap-south-1a"
    tags = {
      Name = "db-1"
    }
    },
    {
      cidr_block = "192.168.3.0/24"
      az         = "ap-south-1b"
      tags = {
        Name = "db-2"
      }
    }

  ]

}

# Web security group to open 5000 port 
module "websg" {
    source = "git::https://github.com/asquarezone/LTTerraformModules.git//aws/securitygroup"
    vpc_id = module.vpc.id
    security_group_info = {
        name = "nop"
        description = "security group for nop"
        inbound_rules = [{
            port = "5000"
            protocol = "tcp"
            source = "0.0.0.0/0"
            description = "open tcp port"
        },
        {
            port = "22"
            protocol = "tcp"
            source = "0.0.0.0/0"
            description = "open ssh port"
        }
            
        ]
    }
}

# db security group to open 5000 port 
module "dbsg" {
    source = "git::https://github.com/asquarezone/LTTerraformModules.git//aws/securitygroup"
    vpc_id = module.vpc.id
    security_group_info = {
        name = "nop"
        description = "security group for nop"
        inbound_rules = [{
            port = "3306"
            protocol = "tcp"
            source = "192.168.0.0/16"
            description = "open tcp port"
        }
        ]
    }
}

# db security group to open 5000 port 
module "lbsg" {
    source = "git::https://github.com/asquarezone/LTTerraformModules.git//aws/securitygroup"
    vpc_id = module.vpc.id
    security_group_info = {
        name = "nop"
        description = "security group for nop"
        inbound_rules = [{
            port = "80"
            protocol = "tcp"
            source = "0.0.0.0/0"
            description = "open tcp port"
        }
        ]
    }
}

