variable "vnet_name" {
  type        = string
  default     = "ntier"
  description = "virtual network name"
}

variable "subnet_names" {
  type        = list(string)
  default     = ["web", "app-1", "app-2", "db"]
  description = "subnet-names"
}

variable "vnet_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "vnet cidr"
}

variable "subnet_cidrs" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "resource_group_name" {
  type    = string
  default = "terraform"
}

variable "resource_group_location" {
  type    = string
  default = "eastus"

}

