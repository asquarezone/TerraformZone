terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

module "myvpc" {
    source = "./modules/myvpc"
    ntier_cidr = "10.1.0.0/16"
    ntier_subnet_tags = ["ntier-web1", "ntier-app1", "ntier-db1", "ntier-web2", "ntier-app2", "ntier-db2"]
    ntier_subnet_azs = ["ap-south-1a","ap-south-1a","ap-south-1a", "ap-south-1b","ap-south-1b","ap-south-1b"]
    web_subnet_indexes = [ 0,3]
    other_subnet_indexes = [ 1,2,4,5]
  
}

output "vpcid" {
   value = module.myvpc.vpcid
  
}