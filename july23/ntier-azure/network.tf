resource "azurerm_virtual_network" "ntier_vnet" {
  name                = "ntier-vnet"
  resource_group_name = azurerm_resource_group.ntier.name
  address_space       = var.network_range
  location            = azurerm_resource_group.ntier.location

  # explicit dependency
  depends_on = [
    azurerm_resource_group.ntier
  ]
}