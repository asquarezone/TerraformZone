resource_group_name = "ntier1"
location            = "eastus"
network_cidr        = "192.168.0.0/16"
subnet_names        = ["web", "app"]
nsg_names           = ["web", "business", "data"]
webnsg_rules_info = [{
  name                       = "AllowHttp"
  protocol                   = "Tcp"
  source_address_prefix      = "*"
  source_port_range          = "*"
  destination_address_prefix = "*"
  destination_port_range     = "80"
  direction                  = "Inbound"
  access                     = "Allow"
  priority                   = 300
  nsg_name                   = "web"
  },
  {
    name                       = "AllowHttps"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "443"
    direction                  = "Inbound"
    access                     = "Allow"
    priority                   = 310
    nsg_name                   = "web"
  },
  {
    name                       = "Allowssh"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "22"
    direction                  = "Inbound"
    access                     = "Allow"
    priority                   = 320
    nsg_name                   = "web"
  },
  {
    name                       = "Allowicmp"
    protocol                   = "Icmp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "*"
    direction                  = "Inbound"
    access                     = "Allow"
    priority                   = 1000
    nsg_name                   = "business"
  },
  {
    name                       = "Allowicmps"
    protocol                   = "Icmp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "*"
    direction                  = "Inbound"
    access                     = "Allow"
    priority                   = 1000
    nsg_name                   = "data"
  }
]