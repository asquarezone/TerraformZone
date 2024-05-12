# assigning variable values
primary_network_cidr = ["192.168.0.0/16"]
subnet_names         = ["web", "app", "db"]
subnet_cidrs         = ["192.168.0.0/24", "192.168.1.0/24", "192.168.2.0/24"]
web_nsg_rules = [{
  name                       = "openhttp"
  description                = "this opens 80 port"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "80"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
  access                     = "Allow"
  priority                   = 1000
  }, {
  name                       = "openssh"
  description                = "this opens 22 port"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "22"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
  access                     = "Allow"
  priority                   = 1010
}]