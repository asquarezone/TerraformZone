variable "target_region" {
    type        = string
    default     = "ap-south-1"
    description = "region where the infra can be created"
}

variable "vpc_cidr_range" {
    type        = string
    description = "cidr range of vpc"
}

variable "web1_cidr_range" {
    type        = string
    description = "cidr range of web1 subnet"
}

variable "web2_cidr_range" {
    type        = string
    description = "cidr range of web2 subnet"
}

variable "web1_az" {
    type        = string
    description = "az of web1 subnet"
}

variable "web2_az" {
    type        = string
    description = "az of web2 subnet"
}


variable "db1_cidr_range" {
    type        = string
    description = "cidr range of db1 subnet"
}

variable "db2_cidr_range" {
    type        = string
    description = "cidr range of db2 subnet"
}

variable "db1_az" {
    type        = string
    description = "az of db1 subnet"
}

variable "db2_az" {
    type        = string
    description = "az of db2 subnet"
}

