resource "azurerm_resource_group" "base" {
  name     = "terraform"
  location = "eastus"
}

resource "azurerm_virtual_network" "base" {
  name                = "terraform"
  resource_group_name = azurerm_resource_group.base.name # implicit 
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.base.location # implicit 
  # explicit
  depends_on = [
    azurerm_resource_group.base
  ]

}

resource "azurerm_subnet" "web" {
  name                 = "web"
  resource_group_name  = azurerm_resource_group.base.name
  virtual_network_name = azurerm_virtual_network.base.name
  address_prefixes     = ["10.0.0.0/24"]
  depends_on = [
    azurerm_virtual_network.base
  ]
}

resource "azurerm_subnet" "app-1" {
  name                 = "app-1"
  resource_group_name  = azurerm_resource_group.base.name
  virtual_network_name = azurerm_virtual_network.base.name
  address_prefixes     = ["10.0.1.0/24"]
  depends_on = [
    azurerm_virtual_network.base
  ]
}

resource "azurerm_subnet" "app-2" {
  name                 = "app-2"
  resource_group_name  = azurerm_resource_group.base.name
  virtual_network_name = azurerm_virtual_network.base.name
  address_prefixes     = ["10.0.2.0/24"]
  depends_on = [
    azurerm_virtual_network.base
  ]
}

resource "azurerm_subnet" "db" {
  name                 = "db"
  resource_group_name  = azurerm_resource_group.base.name
  virtual_network_name = azurerm_virtual_network.base.name
  address_prefixes     = ["10.0.3.0/24"]
  depends_on = [
    azurerm_virtual_network.base
  ]
}

