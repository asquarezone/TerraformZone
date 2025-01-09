variable "location" {
  type        = string
  description = "location of the resource group"
  default     = "eastus"
}

variable "purpose" {
  type        = string
  description = "purpose of the resource group"
  default     = "ntier"
}

variable "network_info" {
  type = object({
    address_space = optional(list(string), ["10.0.0.0/16"])
    subnets       = map(string)
  })
  description = "network information"
}

variable "nsg_info" {
  type = object({
    name = string
    security_rules = list(object({
      name                       = string
      priority                   = number
      direction                  = optional(string, "Inbound")
      protocol                   = optional(string, "Tcp")
      source_port_range          = optional(string, "*")
      destination_port_range     = optional(string, "*")
      source_address_prefix      = optional(string, "*")
      destination_address_prefix = optional(string, "*")
      access                     = optional(string, "Deny")
    }))
  })

}

variable "webserver_subnet" {
  type = string
}

variable "webserver_info" {
  type = object({
    name             = string
    size             = optional(string, "Standard_B1s")
    admin_username   = optional(string, "qtdevops")
    public_key_path  = optional(string, "~/.ssh/id_rsa.pub")
    private_key_path = optional(string, "~/.ssh/id_rsa")
  })

}


