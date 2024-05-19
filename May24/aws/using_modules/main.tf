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