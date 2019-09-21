variable "myaccesskey" {
  type = "string"
}

variable "mysecretkey" {
  type = "string"
}

variable "myregion" {
  type = "string"
  default = "us-west-2"
}

variable "appserver_ami" {
    type = "string"
    default = "ami-076e276d85f524150"
}

variable "appserver_instancetype" {
    type = "string"
    default = "t2.micro"
}

variable "appserver_keyName" {
    type = "string"
    default = "oregon"
  
}

