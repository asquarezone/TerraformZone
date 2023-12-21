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

