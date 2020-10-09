# variable for region
variable region {
  type        = string
  default     = "us-west-2"
  description = "target region for creating resources"
}

#
variable vpc_cidr {
  type        = string
  default     = "192.168.0.0/16"
  description = "cidr range of vpc"
}

