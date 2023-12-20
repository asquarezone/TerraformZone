variable "region" {
  type        = string
  default     = "us-east-1"
  description = "region in which resources will be created"
}

variable "vpc_cidr" {
  type    = string
  default = "10.100.0.0/16"
}


variable "subnetcount" {
  type    = number
  default = 3
}

variable "subnet_names" {
  type    = list(string)
  default = ["web", "business", "data"]

}

