variable "myaccesskey" {
    type = "string"
    description ="Access key of your aws account"
  
}


variable "mysecretkey" {
    type = "string"
    description ="your secret access key"
}

variable "myregion" {
    type = "string"
    description ="Enter Region"
    default = "us-west-2"
  
}

variable "myaz" {
    type = "string"
    description = "Enter Availability Zone"
    default = "us-west-2c"
}


