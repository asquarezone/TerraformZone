variable "vnet_range" {
    default     = "192.168.0.0/16"
    description = "Address space of the vnet"
  
}

variable "region" {
    default = "eastus"
}


variable "subnet_names" {
    default = ["web-1", "web-2", "db-1", "db-2"]
}
