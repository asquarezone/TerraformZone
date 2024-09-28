module "vpc" {
  source = "../.."
  vpc_info = {
    cidr_block           = "192.168.0.0/16"
    enable_dns_hostnames = true
    tags = {
      Name    = "simple-vpc"
      Purpose = "example"
    }
  }
  public_subnets = [{
    cidr_block = "192.168.0.0/24"
    az         = "ap-south-1a"
    tags = {
      Name = "public"
    }
  }]
  private_subnets = [{
    cidr_block = "192.168.1.0/24"
    az         = "ap-south-1a"
    tags = {
      Name = "private"
    }
    }

  ]


}