resource_group_info = {
  name     = "ntier"
  location = "eastus"
}

network_info = {
  name          = "ntier"
  address_space = ["192.168.0.0/16"]
}

subnets_info = [{
  name          = "web"
  address_space = ["192.168.0.0/24"]
  }, {
  name          = "app"
  address_space = ["192.168.1.0/24"]
  }, {
  name          = "db"
  address_space = ["192.168.2.0/24"]
}]

web_nsg_info = {
  name = "web"
  rules = [{
    name                       = "openssh"
    priority                   = 300
    description                = "open ssh"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    }, {
    name                       = "openhttp"
    priority                   = 350
    description                = "open http"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    }, {
    name                       = "openhttps"
    priority                   = 400
    description                = "open https"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }]
}

app_nsg_info = {
  name  = "app"
  rules = []
}

public_ip_info = {
  name              = "webip"
  allocation_method = "Static"
  sku               = "Standard"
}