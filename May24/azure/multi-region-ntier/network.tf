# create a virtual Network

resource "azurerm_virtual_network" "primary" {
  name                = "primary"
  resource_group_name = azurerm_resource_group.group.name
  location            = azurerm_resource_group.group.location
  address_space       = var.primary_network_cidr
  tags = {
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }
  depends_on = [azurerm_resource_group.group]
}

#create multiple subnets
resource "azurerm_subnet" "subnets" {
  count                = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  resource_group_name  = azurerm_resource_group.group.name
  virtual_network_name = azurerm_virtual_network.primary.name
  address_prefixes     = [var.subnet_cidrs[count.index]]
  depends_on           = [azurerm_virtual_network.primary]
}

