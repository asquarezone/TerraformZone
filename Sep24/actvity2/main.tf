resource "azurerm_resource_group" "base" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_virtual_network" "base" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.base.name # implicit 
  address_space       = [var.vnet_cidr]
  location            = azurerm_resource_group.base.location # implicit 
  # explicit
  depends_on = [
    azurerm_resource_group.base
  ]

}

# This creates 4 resources
resource "azurerm_subnet" "subnets" {
  count                = 4
  name                 = var.subnet_names[count.index]
  resource_group_name  = azurerm_resource_group.base.name
  virtual_network_name = azurerm_virtual_network.base.name
  address_prefixes     = [var.subnet_cidrs[count.index]]
  depends_on = [
    azurerm_virtual_network.base
  ]
}


