variable "region" {
    type = string
    default = "ap-south-1"
    description = "variable for a region in aws"
}

variable "vpc_cidr" {
    type = string
    default = "10.100.0.0/16"
    description = "variable for network range"
}