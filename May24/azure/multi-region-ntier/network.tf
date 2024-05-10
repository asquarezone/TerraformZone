# create a virtual Network

resource "azurerm_virtual_network" "primary" {
  name                = "primary"
  resource_group_name = azurerm_resource_group.group.name
  location            = azurerm_resource_group.group.location
  address_space       = ["192.168.0.0/16"]
  subnet {
    name           = "web"
    address_prefix = "192.168.0.0/24"
  }
  subnet {
    name           = "db"
    address_prefix = "192.168.1.0/24"
  }
  depends_on = [azurerm_resource_group.group]
}