variable "ami" {
    type = "string"
    default = "ami-0bbe6b35405ecebdb"
}

variable "secgroupids" {
  type = "list"
  default = ["sg-0932ebd2a5e0368eb"]
}


variable "instancetype" {
    type = "string"
    default = "t2.micro"
  
}

variable "keyname" {
    type = "string"
    default = "oregon"
  
}




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


