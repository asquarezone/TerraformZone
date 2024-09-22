# create a virtual network
resource "azurerm_virtual_network" "ntier" {
  name                = var.network_info.name
  resource_group_name = azurerm_resource_group.base.name
  location            = azurerm_resource_group.base.location
  address_space       = var.network_info.address_space
  depends_on          = [azurerm_resource_group.base]
}

# create subnets

resource "azurerm_subnet" "subnets" {
  count                = length(var.subnets_info)
  name                 = var.subnets_info[count.index].name
  address_prefixes     = var.subnets_info[count.index].address_space
  virtual_network_name = azurerm_virtual_network.ntier.name
  resource_group_name  = azurerm_resource_group.base.name
  depends_on           = [azurerm_virtual_network.ntier]
}


# create public ip

resource "azurerm_public_ip" "web" {
  resource_group_name = azurerm_resource_group.base.name
  location            = azurerm_resource_group.base.location
  allocation_method   = var.public_ip_info.allocation_method
  sku                 = var.public_ip_info.sku
  name                = var.public_ip_info.name
  depends_on          = [azurerm_resource_group.base]

}