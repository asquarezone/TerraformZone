variable "target_region" {
    type        = string
    default     = "ap-south-1"
    description = "region where the infra can be created"
}

variable "vpc_cidr_range" {
    type        = string
    default     = "192.168.0.0/16"
    description = "cidr range of vpc"
}