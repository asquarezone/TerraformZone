variable "region" {
  type        = string
  default     = "ap-south-1"
  description = "variable for a region in aws"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.100.0.0/16"
  description = "variable for network range"
}

variable "subnets_info" {
  type = list(object({
    name = string
    cidr = string
    az   = string
  }))
  default = [{
    name = "web-1"
    cidr = "10.100.0.0/24"
    az   = "ap-south-1a"
  }]

}
