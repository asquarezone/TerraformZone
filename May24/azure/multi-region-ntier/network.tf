# create a virtual Network

resource "azurerm_virtual_network" "primary" {
  name                = "primary"
  resource_group_name = azurerm_resource_group.group.name
  location            = azurerm_resource_group.group.location
  address_space       = var.primary_network_cidr
  subnet {
    name           = "web"
    address_prefix = var.web_subnet_cidr
  }
  subnet {
    name           = "db"
    address_prefix = var.db_subnet_cidr
  }
  depends_on = [azurerm_resource_group.group]
}