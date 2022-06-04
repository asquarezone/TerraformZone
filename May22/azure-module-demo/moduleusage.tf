

resource "azurerm_resource_group" "example" {
  name     = "moduleusage"
  location = "Central US"
}

module "network" {
  source  = "Azure/network/azurerm"
  version = "3.5.0"
  resource_group_name = azurerm_resource_group.example.name
  address_spaces      = ["192.168.0.0/16"]
  subnet_prefixes     = ["192.168.0.0/24", "192.168.1.0/24"]
  subnet_names        = ["web", "db"]

  depends_on = [
    azurerm_resource_group.example
  ]
}