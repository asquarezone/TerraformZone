# create web nsg
resource "azurerm_network_security_group" "web" {
  name                = var.web_nsg_info.name
  resource_group_name = azurerm_resource_group.base.name
  location            = azurerm_resource_group.base.location
  depends_on          = [azurerm_resource_group.base]
}

resource "azurerm_network_security_rule" "web" {
  count                       = length(var.web_nsg_info.rules)
  resource_group_name         = azurerm_resource_group.base.name
  network_security_group_name = azurerm_network_security_group.web.name
  name                        = var.web_nsg_info.rules[count.index].name
  priority                    = var.web_nsg_info.rules[count.index].priority
  direction                   = var.web_nsg_info.rules[count.index].direction
  access                      = var.web_nsg_info.rules[count.index].access
  source_port_range           = var.web_nsg_info.rules[count.index].source_port_range
  destination_port_range      = var.web_nsg_info.rules[count.index].destination_port_range
  protocol                    = var.web_nsg_info.rules[count.index].protocol
  description                 = var.web_nsg_info.rules[count.index].description
  source_address_prefix       = var.web_nsg_info.rules[count.index].source_address_prefix
  destination_address_prefix  = var.web_nsg_info.rules[count.index].destination_address_prefix
  depends_on                  = [azurerm_network_security_group.web]

}


# create app nsg
resource "azurerm_network_security_group" "app" {
  name                = var.app_nsg_info.name
  resource_group_name = azurerm_resource_group.base.name
  location            = azurerm_resource_group.base.location
  depends_on          = [azurerm_resource_group.base]
}

resource "azurerm_network_security_rule" "app" {
  count                       = length(var.app_nsg_info.rules)
  resource_group_name         = azurerm_resource_group.base.name
  network_security_group_name = azurerm_network_security_group.app.name
  name                        = var.app_nsg_info.rules[count.index].name
  priority                    = var.app_nsg_info.rules[count.index].priority
  direction                   = var.app_nsg_info.rules[count.index].direction
  access                      = var.app_nsg_info.rules[count.index].access
  source_port_range           = var.app_nsg_info.rules[count.index].source_port_range
  destination_port_range      = var.app_nsg_info.rules[count.index].destination_port_range
  protocol                    = var.app_nsg_info.rules[count.index].protocol
  description                 = var.app_nsg_info.rules[count.index].description
  source_address_prefix       = var.app_nsg_info.rules[count.index].source_address_prefix
  destination_address_prefix  = var.app_nsg_info.rules[count.index].destination_address_prefix
  depends_on                  = [azurerm_network_security_group.app]

}