resource "azurerm_resource_group" "preschool" {
  name     = "preschool"
  location = "East US"
  tags = {
    CreatedBy   = "Terraform"
    Environment = "Dev"
  }

}

resource "azurerm_virtual_network" "preschool" {
  name                = "preschool-net"
  location            = azurerm_resource_group.preschool.location
  resource_group_name = azurerm_resource_group.preschool.name
  address_space       = ["10.0.0.0/16"]
  subnet {
    name           = "web"
    address_prefix = "10.0.1.0/24"
  }
  subnet {
    name           = "db"
    address_prefix = "10.0.2.0/24"
  }

}