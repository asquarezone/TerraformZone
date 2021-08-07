variable "ntier_cidr" {
    type = string
    default = "10.10.0.0/16"
}

variable "ntier_region" {
    type = string
    default = "ap-south-1"
}

variable "ntier_subnet_cidrs" {
    type = list(string)
    default = [ "10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24" ]
}

variable "ntier_subnet_azs" {
    default = ["ap-south-1a","ap-south-1a","ap-south-1a"]
  
}

variable "ntier_subnet_tags" {
    default = ["ntier-web1", "ntier-app1", "ntier-db1"]
  
}