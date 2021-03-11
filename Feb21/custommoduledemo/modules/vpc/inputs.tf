variable "vpccidr" {
  type = string
  default = "192.168.0.0/16"
  description = "cidr range of the vpc"
}

variable "region" {
    type = string
    default = "us-west-2"
    description = "region"
    
}
