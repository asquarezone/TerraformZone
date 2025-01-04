# Resource group
resource "azurerm_resource_group" "base" {
  name     = var.resource_group.name
  location = var.resource_group.location
}

# Virtual network
resource "azurerm_virtual_network" "ntier" {
  name                = "${var.resource_group.name}-net"
  resource_group_name = azurerm_resource_group.base.name
  address_space       = [var.vnet_address_space]
  location            = azurerm_resource_group.base.location
  depends_on          = [azurerm_resource_group.base]
}


resource "azurerm_subnet" "subnets" {
  count                = length(var.subnets)
  resource_group_name  = azurerm_resource_group.base.name
  virtual_network_name = azurerm_virtual_network.ntier.name
  name                 = var.subnets[count.index].name
  address_prefixes     = [var.subnets[count.index].address_space]
  depends_on = [
    azurerm_resource_group.base,
    azurerm_virtual_network.ntier
  ]
}
