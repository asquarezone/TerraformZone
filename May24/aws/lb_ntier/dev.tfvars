network_info = {
  name               = "ntier"
  cidr               = "10.10.0.0/16"
  azs                = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
  private_subnets    = ["10.10.50.0/24", "10.10.51.0/24", "10.10.52.0/24"]
  public_subnets     = ["10.10.0.0/24", "10.10.1.0/24"]
  enable_nat_gateway = false
  enable_vpn_gateway = false
}