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
  default = "ami-0813ccdc43fc2709c"
}

variable "key" {
  default = "terraform"
}

variable "instancetype" {
  default = "t2.micro"
}
