variable "access" {}
variable "secret" {}
variable "region" {
    default = "us-west-2"
}
variable "instancetype" {
    default = "t2.micro"
}

variable "imageid" {
    default = "ami-09b390612e0d18528"
}

variable "keyname"{
    default = "Packer"
}

variable "secgroups" {
    type = "list"
    default = ["AllTCP"]
}

variable "private_key_path" {
    default = "Packer.pem"
}
