variable "location" {
  type        = string
  default     = "eastus"
  description = "location to create resource"
}

variable "vnet_range" {
  type        = list(string)
  default     = ["192.168.0.0/16"]
  description = "cidr range of vnet"
}

variable "subnet_names" {
  type    = list(string)
  default = ["web", "app", "db"]

}

variable "names" {
  type = object({
    resource_group = string
    vnet           = string
    sql_server     = string
  })
  default = {
    resource_group = "ntier-rg"
    vnet           = "ntier-vnet"
    sql_server     = "qtntierdb-dev"
  }
}


variable "server_info" {
  type = object({
    version  = string
    username = string
    password = string
  })
  default = {
    password = "ThisPasswordisnotgreat@1"
    username = "devops"
    version  = "12.0"
  }

}

variable "database_info" {
  type = object({
    name = string
    sku  = string
  })
  default = {
    name = "employees"
    sku  = "Basic"
  }

}

variable "network_interface_info" {
  type = object({
    name                 = string
    ip_name              = string
    subnet_index         = number
    ip_allocation_method = string
  })
  default = {
    ip_allocation_method = "Dynamic"
    ip_name              = "appserverip"
    name                 = "appservernic"
    subnet_index         = 1
  }
}

variable "vm_info" {
  type = object({
    name     = string
    username = string
    password = string
    size     = string
  })
  default = {
    name     = "appserver1"
    password = "ThisPasswordisnotgreat@1"
    size     = "Standard_B1s"
    username = "qtdevops"
  }

}