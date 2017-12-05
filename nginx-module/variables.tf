variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "private_key_path" {}
variable "key_name" {
  default = "buildserver"
}
variable "instance_type" {
  default = "t2.micro"
}

variable "environment_name" {
  default = "Dev"
}
