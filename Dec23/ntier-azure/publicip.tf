resource "azurerm_public_ip" "webip" {
  name                = "webip"
  location            = var.location
  resource_group_name = azurerm_resource_group.ntier.name
  allocation_method   = "Static"

}