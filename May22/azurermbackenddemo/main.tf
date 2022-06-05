resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = "Central US"
}

module "vnet" {
  source              = "Azure/vnet/azurerm"
  resource_group_name = var.resource_group_name
  address_space       = var.address_spaces
  subnet_prefixes     = var.subnets
  subnet_names        = var.subnet_names


  tags = {
    environment = "dev"
    costcenter  = "it"
  }

  depends_on = [azurerm_resource_group.example]
}