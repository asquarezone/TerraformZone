variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "private_key_path" {
    default = "terraform.pem"
}
variable "key_name" {
    default = "terraform"
}
variable "aws_region" {
    default = "us-west-2"
}
variable "imageid" {
    default = "ami-f2d3638a"
}
variable "homepagepath" {
    default = "index.html"
}

variable "security_groups" {
    type = "list"
}