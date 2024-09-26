resource "azurerm_resource_group" "base" {
  name     = var.resource_group.name
  location = var.resource_group.location
  tags = {
    Environment = terraform.workspace
  }
}

# create network
resource "azurerm_virtual_network" "base" {
  name                = var.network_info.name
  location            = azurerm_resource_group.base.location
  address_space       = [var.network_info.address_space]
  resource_group_name = azurerm_resource_group.base.name
  depends_on          = [azurerm_resource_group.base]
  tags = {
    Environment = terraform.workspace
  }
}

# create subnets
resource "azurerm_subnet" "base" {
  count                = length(var.network_info.subnets)
  name                 = var.network_info.subnets[count.index].name
  virtual_network_name = azurerm_virtual_network.base.name
  resource_group_name  = azurerm_resource_group.base.name
  address_prefixes     = var.network_info.subnets[count.index].address_prefixes

}
