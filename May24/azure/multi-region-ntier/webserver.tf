# create a public ip address
resource "azurerm_public_ip" "web" {
  name                = "web"
  resource_group_name = azurerm_resource_group.group.name
  location            = azurerm_resource_group.group.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = {
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }
  depends_on = [azurerm_resource_group.group]
}

# Create network security group
resource "azurerm_network_security_group" "web" {
  name                = "webnsg"
  resource_group_name = azurerm_resource_group.group.name
  location            = azurerm_resource_group.group.location
  tags = {
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }

  depends_on = [azurerm_resource_group.group]
}


resource "azurerm_network_security_rule" "web" {
  count                       = length(var.web_nsg_rules)
  name                        = var.web_nsg_rules[count.index].name
  resource_group_name         = azurerm_resource_group.group.name
  network_security_group_name = azurerm_network_security_group.web.name
  description                 = var.web_nsg_rules[count.index].description
  protocol                    = var.web_nsg_rules[count.index].protocol
  source_port_range           = var.web_nsg_rules[count.index].source_port_range
  destination_port_range      = var.web_nsg_rules[count.index].destination_port_range
  source_address_prefix       = var.web_nsg_rules[count.index].source_address_prefix
  destination_address_prefix  = var.web_nsg_rules[count.index].destination_address_prefix
  access                      = var.web_nsg_rules[count.index].access
  priority                    = var.web_nsg_rules[count.index].priority
  direction                   = "Inbound"
  depends_on = [
    azurerm_resource_group.group,
    azurerm_network_security_group.web
  ]

}