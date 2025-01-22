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
  type    = string
  default = "ap-south-1"
}

variable "web_sg_info" {
  type = object({
    name                = string
    description         = string
    ingress_cidr_blocks = list(string)
    ingress_rules       = list(string)
    egress_cidr_blocks  = optional(list(string), ["0.0.0.0/0"])
    egress_rules        = optional(list(string), ["all-all"])
  })

}

variable "web_server_info" {
  type = object({
    name             = string
    size             = optional(string, "t2.micro")
    key_pair         = optional(string, "my_idrsa")
    count            = optional(number, 2)
    private_key_path = optional(string, "~/.ssh/id_rsa")
    username         = optional(string, "ubuntu")
  })

}

variable "build_id" {
  type = string
}