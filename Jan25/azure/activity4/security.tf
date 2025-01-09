resource "azurerm_network_security_group" "web" {
  resource_group_name = azurerm_resource_group.base.name
  location            = var.location
  name                = var.nsg_info.name
}

resource "azurerm_network_security_rule" "rules" {
  count                       = length(var.nsg_info.security_rules)
  name                        = var.nsg_info.security_rules[count.index].name
  priority                    = var.nsg_info.security_rules[count.index].priority
  direction                   = var.nsg_info.security_rules[count.index].direction
  protocol                    = var.nsg_info.security_rules[count.index].protocol
  access                      = var.nsg_info.security_rules[count.index].access
  source_port_range           = var.nsg_info.security_rules[count.index].source_port_range
  destination_port_range      = var.nsg_info.security_rules[count.index].destination_port_range
  source_address_prefix       = var.nsg_info.security_rules[count.index].source_address_prefix
  destination_address_prefix  = var.nsg_info.security_rules[count.index].destination_address_prefix
  resource_group_name         = azurerm_resource_group.base.name
  network_security_group_name = azurerm_network_security_group.web.name

}
