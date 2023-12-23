resource "azurerm_resource_group" "ntier" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    Env       = "Dev"
    CreatedBy = "Terraform"
  }
}

resource "azurerm_virtual_network" "primary" {
  address_space = [var.network_cidr]
  name          = format("%s-primary", var.resource_group_name)
  // "${var.resource_group_name}-primary"
  location = var.location
  // implicit dependency
  resource_group_name = azurerm_resource_group.ntier.name

  // explicit dependency
  depends_on = [
    azurerm_resource_group.ntier
  ]

}


resource "azurerm_subnet" "subnets" {
  count                = length(var.subnet_names)
  address_prefixes     = [cidrsubnet(var.network_cidr, 8, count.index)]
  virtual_network_name = azurerm_virtual_network.primary.name
  name                 = var.subnet_names[count.index]
  resource_group_name  = azurerm_resource_group.ntier.name
  depends_on           = [azurerm_virtual_network.primary]
}


resource "azurerm_network_security_group" "webnsg" {
  name                = "webnsg"
  resource_group_name = azurerm_resource_group.ntier.name
  location            = var.location
  depends_on          = [azurerm_virtual_network.primary]
}

resource "azurerm_network_security_rule" "web_rules" {
  count                       = length(var.webnsg_rules_info)
  name                        = var.webnsg_rules_info[count.index].name
  resource_group_name         = azurerm_resource_group.ntier.name
  network_security_group_name = "webnsg"
  protocol                    = var.webnsg_rules_info[count.index].protocol
  source_port_range           = var.webnsg_rules_info[count.index].source_port_range
  destination_port_range      = var.webnsg_rules_info[count.index].destination_port_range
  direction                   = var.webnsg_rules_info[count.index].direction
  source_address_prefix       = var.webnsg_rules_info[count.index].source_address_prefix
  destination_address_prefix  = var.webnsg_rules_info[count.index].destination_address_prefix
  access                      = var.webnsg_rules_info[count.index].access
  priority                    = var.webnsg_rules_info[count.index].priority
  depends_on = [ azurerm_network_security_group.webnsg ]
}


