variable "primary_region" {
  type    = string
  default = "ap-south-1"
}

variable "key_name" {
  type    = string
  default = "my_idrsa"
}

variable "security_group_name" {
  type    = string
  default = "openall"
}

variable "az" {
  type    = string
  default = "ap-south-1a"
}

variable "instance_size" {
  type    = string
  default = "t2.micro"
}

variable "key_path" {
  type    = string
  default = "~/.ssh/id_rsa"

}

variable "build_id" {
    type = string
    default = "1"
  
}

