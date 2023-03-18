resource "azurerm_resource_group" "ntierrg" {
  location = "eastus"
  name     = "ntier-rg"
}

resource "azurerm_virtual_network" "ntiervnet" {
  name                = "ntier-vnet"
  resource_group_name = "ntier-rg"
  address_space       = ["192.168.0.0/16"]
  location            = "eastus"
  depends_on = [
    azurerm_resource_group.ntierrg
  ]

}