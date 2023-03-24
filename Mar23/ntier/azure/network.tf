resource "azurerm_resource_group" "ntierrg" {
  location = var.location
  name     = var.names.resource_group
  tags = {
    Env       = "Dev"
    CreatedBy = "Terraform"
  }
}

resource "azurerm_virtual_network" "ntiervnet" {
  name                = var.names.vnet
  resource_group_name = azurerm_resource_group.ntierrg.name
  address_space       = var.vnet_range
  location            = var.location
  depends_on = [
    azurerm_resource_group.ntierrg
  ]
  tags = {
    Env       = "Dev"
    CreatedBy = "Terraform"
  }
}


resource "azurerm_subnet" "subnets" {
  count                = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  resource_group_name  = azurerm_resource_group.ntierrg.name
  virtual_network_name = azurerm_virtual_network.ntiervnet.name
  address_prefixes     = [cidrsubnet(var.vnet_range[0], 8, count.index)]
  depends_on = [
    azurerm_virtual_network.ntiervnet
  ]
}