variable "address_space" {
    type = list(string)
    default = [ "192.168.0.0/16" ]
}

variable "resource_group_name" {
    type = string
    default = "my_resg"
}

variable "target_region" {
    type = string
    default = "eastus"
}