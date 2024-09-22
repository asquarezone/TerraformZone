# create a virtual network
resource "azurerm_virtual_network" "ntier" {
  name                = var.network_info.name
  resource_group_name = azurerm_resource_group.base.name
  location            = azurerm_resource_group.base.location
  address_space       = var.network_info.address_space
  depends_on          = [azurerm_resource_group.base]
}

# create subnets

resource "azurerm_subnet" "subnets" {
  count                = length(var.subnets_info)
  name                 = var.subnets_info[count.index].name
  address_prefixes     = var.subnets_info[count.index].address_space
  virtual_network_name = azurerm_virtual_network.ntier.name
  resource_group_name  = azurerm_resource_group.base.name
  depends_on           = [azurerm_virtual_network.ntier]
}


# create public ip

resource "azurerm_public_ip" "web" {
  resource_group_name = azurerm_resource_group.base.name
  location            = azurerm_resource_group.base.location
  allocation_method   = var.public_ip_info.allocation_method
  sku                 = var.public_ip_info.sku
  name                = var.public_ip_info.name
  depends_on          = [azurerm_resource_group.base]

}


# create a network interface
resource "azurerm_network_interface" "web" {
  name                = "web-nic"
  resource_group_name = azurerm_resource_group.base.name
  location            = azurerm_resource_group.base.location
  ip_configuration {
    name                          = "webip"
    subnet_id                     = azurerm_subnet.subnets[0].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.web.id
  }

  depends_on = [
    azurerm_resource_group.base,
    azurerm_subnet.subnets
  ]

}

resource "azurerm_network_interface_security_group_association" "web" {
  network_interface_id      = azurerm_network_interface.web.id
  network_security_group_id = azurerm_network_security_group.web.id
  depends_on = [
    azurerm_network_interface.web,
    azurerm_network_security_group.web
  ]

}