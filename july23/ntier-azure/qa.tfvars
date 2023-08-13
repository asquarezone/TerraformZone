resource_group_name = "ntier-qa"
location            = "eastus"
network_range       = "10.11.0.0/16"
subnet_names        = ["web", "app", "db", "mgmt"]
web_nsg_config = {
  name = "webnsg"
  rules = [{
    name                       = "openhttp"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    destination_port_range     = "80"
    direction                  = "Inbound"
    priority                   = "300"
    access                     = "Allow"
    source_port_range          = "*"
    destination_address_prefix = "*"
    },
    {
      name                       = "openssh"
      protocol                   = "Tcp"
      source_address_prefix      = "*"
      destination_port_range     = "22"
      direction                  = "Inbound"
      priority                   = "310"
      access                     = "Allow"
      source_port_range          = "*"
      destination_address_prefix = "*"
    }
  ]
}

app_nsg_config = {
  name = "appnsg"
  rules = [{
    name                       = "open8080"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    destination_port_range     = "8080"
    direction                  = "Inbound"
    priority                   = "300"
    access                     = "Allow"
    source_port_range          = "*"
    destination_address_prefix = "*"
    },
    {
      name                       = "open22"
      protocol                   = "Tcp"
      source_address_prefix      = "*"
      destination_port_range     = "22"
      direction                  = "Inbound"
      priority                   = "310"
      access                     = "Allow"
      source_port_range          = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "open5000"
      protocol                   = "Tcp"
      source_address_prefix      = "*"
      destination_port_range     = "5000"
      direction                  = "Inbound"
      priority                   = "320"
      access                     = "Allow"
      source_port_range          = "*"
      destination_address_prefix = "*"
    }
  ]
}

db_info = {
  db_name        = "employee"
  server_name    = "qtazsqlserverfromtf"
  server_version = "12.0"
  user_name      = "Dell"
  password       = "Dell@123@india"
  sku_name       = "Basic"
  max_size_gb    = 2
}

appvm_config = {
  subnet_name = "app"
  size        = "Standard_B1s"
  username    = "Dell"
  keypath     = "~/.ssh/id_rsa.pub"
  private_key_path = "~/.ssh/id_rsa"
  publisher   = "Canonical"
  offer       = "0001-com-ubuntu-server-jammy"
  sku         = "22_04-lts-gen2"
  version     = "latest"
}