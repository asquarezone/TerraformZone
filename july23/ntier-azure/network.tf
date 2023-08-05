resource "azurerm_virtual_network" "ntier_vnet" {
  name                = "ntier-vnet"
  resource_group_name = azurerm_resource_group.ntier.name
  address_space       = [var.network_range]
  location            = azurerm_resource_group.ntier.location

  # explicit dependency
  depends_on = [
    azurerm_resource_group.ntier
  ]
}


resource "azurerm_subnet" "subnets" {
  count                = length(var.subnet_names)
  resource_group_name  = azurerm_resource_group.ntier.name
  virtual_network_name = azurerm_virtual_network.ntier_vnet.name
  # get the address prefix based on count from variable subnet_address_prefixes
  address_prefixes = [cidrsubnet(var.network_range, 8, count.index)]
  # get the name based on count from variable subnet_names
  name = var.subnet_names[count.index]

  depends_on = [
    azurerm_resource_group.ntier,
    azurerm_virtual_network.ntier_vnet
  ]

}