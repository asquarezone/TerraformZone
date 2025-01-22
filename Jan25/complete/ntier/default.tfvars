vpc_info = {
  name                 = "ntier"
  cidr                 = "10.0.0.0/16"
  azs                  = ["ap-south-1a", "ap-south-1b"]
  private_subnets_cidr = ["10.0.0.0/24", "10.0.1.0/24"]
  public_subnets_cidr  = ["10.0.3.0/24", "10.0.4.0/24"]
  tags = {
    Environment = "dev"
    Team        = "DevOps"
  }
}
region = "ap-south-1"
web_sg_info = {
  name                = "websg"
  description         = "open 80,443 and 22"
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp", "http-80-tcp", "https-443-tcp"]
}

web_server_info = {
  name = "web"
}