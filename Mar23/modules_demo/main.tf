provider "aws" {
  region = "us-west-2"
}

module "aws_vpc" {
  source = "./modules/aws_vpc"
  region = "us-west-2"
  subnet_info = {
    names               = ["web", "app", "db", "mgmt"]
    public_subnet_names = ["web"]
  }

}

output "public_subnets" {
    value = module.aws_vpc.public_subnet_ids
}