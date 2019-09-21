variable "accesskey" {
    type = "string"
}

# required variable secretkey
variable "secretkey" {
    type = "string"
}

# optional region
variable "region" {
    type = "string"
    default = "eu-west-3"
}


provider "aws" {
   region       = "${var.region}"
   access_key   = "${var.accesskey}"
   secret_key   = "${var.secretkey}"
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  tags = {
    Terraform = "true"
    Environment = "dev"
    Name = "module demo"
  }
  
}

output "vpcid" {
  value = "${module.vpc.vpc_id}"
}
