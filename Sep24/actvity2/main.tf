resource "azurerm_resource_group" "base" {
  name     = var.resource_group_config.name
  location = var.resource_group_config.location
}

resource "azurerm_virtual_network" "base" {
  name                = var.vnet_config.name
  resource_group_name = azurerm_resource_group.base.name # implicit 
  address_space       = [var.vnet_config.cidr_block]
  location            = azurerm_resource_group.base.location # implicit 
  # explicit
  depends_on = [
    azurerm_resource_group.base
  ]

}

# This creates 4 resources
resource "azurerm_subnet" "subnets" {
  count                = 4
  name                 = var.subnets_config[count.index].name
  resource_group_name  = azurerm_resource_group.base.name
  virtual_network_name = azurerm_virtual_network.base.name
  address_prefixes     = [var.subnets_config[count.index].cidr_block]
  depends_on = [
    azurerm_virtual_network.base
  ]
}


