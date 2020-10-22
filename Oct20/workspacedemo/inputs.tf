variable region {
  type        = string
  default     = "us-west-2"
  description = "default region"
}

variable vpc_name {
  type        = string
  default     = "workspacedemo"
  description = "name of vpc"
}

variable vpc_cidr {
  type        = string
  default     = "10.0.0.0/16"
  description = "vpc cidr"
}

variable azs {
  type        = list(string)
  default     = ["us-west-2a", "us-west-2b", "us-west-2c"]
  description = "availability zones"
}

variable private_subnets {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  description = "private subnet cidrs"
}

variable public_subnets {
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  description = "public subnet cidrs"
}

variable enable_nat_gateway {
  type        = bool
  default     = false
  description = "enable nat gateway"
}

variable enable_vpn_gateway {
  type        = bool
  default     = false
  description = "description"
}
