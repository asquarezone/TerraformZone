# variable for region
variable region {
  type        = string
  default     = "us-west-2"
  description = "target region for creating resources"
}

# vpc range
variable vpc_cidr {
  type        = string
  default     = "192.168.0.0/16"
  description = "cidr range of vpc"
}

# Az's
variable availabilty_zones {
  type        = list(string)
  default     = ["a","b", "c", "a"]
  description = "az's"
}

variable subnet_tags {
  type        = list(string)
  default     = ["web", "app", "db", "mgmt"]
  description = "subnet tags"
}

variable vpctag {
  type        = string
  default     = "from terraform"
  description = "VPC Tag"
}




