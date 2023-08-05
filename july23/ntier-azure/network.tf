resource "azurerm_virtual_network" "ntier_vnet" {
  name                = "ntier-vnet"
  resource_group_name = azurerm_resource_group.ntier.name
  address_space       = [var.network_range]
  location            = azurerm_resource_group.ntier.location

  # explicit dependency
  depends_on = [
    azurerm_resource_group.ntier
  ]
}


resource "azurerm_subnet" "subnets" {
  count                = length(var.subnet_names)
  resource_group_name  = azurerm_resource_group.ntier.name
  virtual_network_name = azurerm_virtual_network.ntier_vnet.name
  # get the address prefix based on count from variable subnet_address_prefixes
  address_prefixes = [cidrsubnet(var.network_range, 8, count.index)]
  # get the name based on count from variable subnet_names
  name = var.subnet_names[count.index]

  depends_on = [
    azurerm_resource_group.ntier,
    azurerm_virtual_network.ntier_vnet
  ]

}



resource "azurerm_network_security_group" "webnsg" {
  name                = var.web_nsg_config.name
  resource_group_name = azurerm_resource_group.ntier.name
  location            = azurerm_resource_group.ntier.location

  depends_on = [
    azurerm_resource_group.ntier
  ]

}

resource "azurerm_network_security_rule" "rules" {
  count                       = length(var.web_nsg_config.rules)
  name                        = var.web_nsg_config.rules[count.index].name
  resource_group_name         = azurerm_resource_group.ntier.name
  network_security_group_name = azurerm_network_security_group.webnsg.name
  protocol                    = var.web_nsg_config.rules[count.index].protocol
  source_address_prefix       = var.web_nsg_config.rules[count.index].source_address_prefix
  source_port_range           = var.web_nsg_config.rules[count.index].source_port_range
  destination_port_range      = var.web_nsg_config.rules[count.index].destination_port_range
  direction                   = var.web_nsg_config.rules[count.index].direction
  priority                    = var.web_nsg_config.rules[count.index].priority
  access                      = var.web_nsg_config.rules[count.index].access
  destination_address_prefix  = var.web_nsg_config.rules[count.index].destination_address_prefix
  depends_on = [
    azurerm_network_security_group.webnsg
  ]
}


resource "azurerm_network_security_group" "appnsg" {
  name                = var.app_nsg_config.name
  resource_group_name = azurerm_resource_group.ntier.name
  location            = azurerm_resource_group.ntier.location

  depends_on = [
    azurerm_resource_group.ntier
  ]

}

resource "azurerm_network_security_rule" "appnsgrules" {
  count                       = length(var.app_nsg_config.rules)
  name                        = var.app_nsg_config.rules[count.index].name
  resource_group_name         = azurerm_resource_group.ntier.name
  network_security_group_name = azurerm_network_security_group.appnsg.name
  protocol                    = var.app_nsg_config.rules[count.index].protocol
  source_address_prefix       = var.app_nsg_config.rules[count.index].source_address_prefix
  source_port_range           = var.app_nsg_config.rules[count.index].source_port_range
  destination_port_range      = var.app_nsg_config.rules[count.index].destination_port_range
  direction                   = var.app_nsg_config.rules[count.index].direction
  priority                    = var.app_nsg_config.rules[count.index].priority
  access                      = var.app_nsg_config.rules[count.index].access
  destination_address_prefix  = var.app_nsg_config.rules[count.index].destination_address_prefix
  depends_on = [
    azurerm_network_security_group.appnsg
  ]
}
