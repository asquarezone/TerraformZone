variable "region" {
  default = "ap-south-1"
  type    = string
}

variable "network_info" {
  type = object({
    name               = string
    cidr               = string
    azs                = list(string)
    private_subnets    = list(string)
    public_subnets     = list(string)
    enable_nat_gateway = bool
    enable_vpn_gateway = bool
  })
}
