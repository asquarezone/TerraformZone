resource "azurerm_virtual_network" "ntier_vnet" {
  name                = "ntier-vnet"
  resource_group_name = azurerm_resource_group.ntier.name
  address_space       = ["10.10.0.0/16"]
  location            = azurerm_resource_group.ntier.location

  # explicit dependency
  depends_on = [
    azurerm_resource_group.ntier
  ]
}