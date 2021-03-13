variable "location" {
    type = string
    description = "location where resources are to be created"
    default = "eastus"
}

variable "subnets" {
    type = list(string)
    description = "subnets to be created"
    default = ["web", "app", "db"]
}

variable "ntiervnetrange" {
    type = string
    description = "range of the vnet"
    default = "192.168.0.0/16"
}