variable "resource_group_name" {
    type = string
    default = "backenddemo"
}

variable "address_spaces" {
    type = list(string)
    default = ["10.0.0.0/16"]
}

variable "subnets" {
    type = list(string)
    default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "subnet_names" {
    type = list(string)
    default = ["subnet1", "subnet2", "subnet3"]
  
}