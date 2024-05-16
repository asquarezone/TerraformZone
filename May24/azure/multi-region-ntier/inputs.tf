### Defined variables

variable "primary_network_cidr" {
  type        = list(string)
  description = "This is primary networks cidr range"
  default     = ["192.168.0.0/16"]
}

variable "subnet_names" {
  type        = list(string)
  default     = ["web", "app", "db"]
  description = "subnet names"

}

variable "subnet_cidrs" {
  type        = list(string)
  default     = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24"]
  description = "subnet cidrs"
}


variable "web_nsg_rules" {
  type = list(object({
    name                       = string
    description                = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
    access                     = string
    priority                   = number
  }))
  description = "web nsg rules"
  default = [{
    name                       = "openhttp"
    description                = "this opens 80 port"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    access                     = "Allow"
    priority                   = 1000
  }]

}


variable "web_vm_info" {
  type = object({
    name            = string
    size            = string
    username        = string
    public_key_path = string
    publisher       = string
    offer           = string
    sku             = string
    version         = string
  })
  default = {
    name            = "webvm"
    size            = "Standard_B1s"
    username        = "Dell"
    public_key_path = "~/.ssh/id_rsa.pub"
    publisher       = "canonical"
    offer           = "0001-com-ubuntu-server-jammy"
    sku             = "22_04-lts-gen2"
    version         = "latest"
  }

}