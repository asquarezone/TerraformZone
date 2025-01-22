variable "vpc_info" {
  type = object({
    name                 = optional(string, "ntier")
    cidr                 = string
    azs                  = list(string)
    private_subnets_cidr = list(string)
    public_subnets_cidr  = list(string)
    enable_nat_gateway   = optional(bool, false)
    enable_vpn_gateway   = optional(bool, false)
    tags                 = map(string)
  })

}

variable "region" {
    type = string
    default = "ap-south-1"
}