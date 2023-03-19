resource "azurerm_resource_group" "ntierrg" {
  location = var.location
  name     = "ntier-rg"
}

resource "azurerm_virtual_network" "ntiervnet" {
  name                = "ntier-vnet"
  resource_group_name = "ntier-rg"
  address_space       = var.vnet-range
  location            = var.location
  depends_on = [
    azurerm_resource_group.ntierrg
  ]

}