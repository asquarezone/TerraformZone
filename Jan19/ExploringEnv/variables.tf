variable "accesskey" {
    type = "string"
  
}
locals {
  vpcname = "main-${terraform.workspace}"
}






variable "secretkey" {
    type = "string"
  
}

variable "region" {
  type = "string"
  default = "us-west-2"
}

variable "statestoragelocations3" {
    type = "string"
    default = "qtterraformstatestorage"
  
}

variable "statestoragekey" {

    type = "string"
    default = "backenddemo"
  
}

