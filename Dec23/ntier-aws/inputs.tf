variable "region" {
  type        = string
  default     = "us-east-1"
  description = "region in which resources will be created"
}

variable "vpc_cidr" {
  type    = string
  default = "10.100.0.0/16"
}

variable "web_cidr" {
  type    = string
  default = "10.100.0.0/24"
}

variable "business_cidr" {
  type    = string
  default = "10.100.1.0/24"
}

variable "data_cidr" {
  type    = string
  default = "10.100.2.0/24"
}