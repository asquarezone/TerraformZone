resource "azurerm_network_security_group" "web_nsg" {
  name                = "webnsg"
  resource_group_name = var.resourcegroup_details.name
  location            = var.resourcegroup_details.location

  security_rule {
    name                       = "openssh"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "openhttp"
    priority                   = 310
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    Env = terraform.workspace
  }

  depends_on = [
    azurerm_resource_group.ntier
  ]
}


resource "azurerm_public_ip" "web_public_ip" {
  name                = "webpublic"
  resource_group_name = var.resourcegroup_details.name
  location            = var.resourcegroup_details.location
  allocation_method   = "Dynamic"

  depends_on = [
    azurerm_resource_group.ntier
  ]
}

resource "azurerm_network_interface" "web_nic" {
  name                = "webnic"
  resource_group_name = var.resourcegroup_details.name
  location            = var.resourcegroup_details.location

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnets[0].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.web_public_ip.id
  }

  depends_on = [
    azurerm_subnet.subnets,
    azurerm_public_ip.web_public_ip
  ]

}

resource "azurerm_network_interface_security_group_association" "webnic_nsg_assc" {
  network_interface_id      = azurerm_network_interface.web_nic.id
  network_security_group_id = azurerm_network_security_group.web_nsg.id

  depends_on = [
    azurerm_network_security_group.web_nsg,
    azurerm_network_interface.web_nic
  ]

}
