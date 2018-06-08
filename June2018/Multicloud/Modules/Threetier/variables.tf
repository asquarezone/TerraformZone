variable "region" {
  default = "us-west-2"
}

variable "accesskey" {
  type = "string"
}

variable "secretkey" {
  type = "string"
}

variable "imageid" {
  default     = "ami-c59ce2bd"
  description = "ubuntu 14 image"
}

variable "key" {
  default = "terraform"
}

variable "instancetype" {
  default = "t2.micro"
}

variable "vpcid" {
  default = "vpc-06a9507f"
}

variable "privatekeypath" {}
