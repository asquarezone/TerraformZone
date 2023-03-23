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


resource "azurerm_subnet" "subnets" {
  count                = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  resource_group_name  = azurerm_resource_group.ntierrg.name
  virtual_network_name = azurerm_virtual_network.ntiervnet.name
  address_prefixes     = [cidrsubnet(var.vnet-range[0], 8, count.index)]
  depends_on = [
    azurerm_virtual_network.ntiervnet
  ]

}