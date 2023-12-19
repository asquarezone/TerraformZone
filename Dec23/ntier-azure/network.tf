resource "azurerm_resource_group" "ntier" {
  name     = "ntier"
  location = "eastus"
  tags = {
    Env       = "Dev"
    CreatedBy = "Terraform"
  }
}

resource "azurerm_virtual_network" "primary" {
  address_space = ["10.100.0.0/16"]
  name          = "ntier-primary"
  location      = "eastus"
  // implicit dependency
  resource_group_name = azurerm_resource_group.ntier.name

  // explicit dependency
  depends_on = [
    azurerm_resource_group.ntier
  ]

}


resource "azurerm_subnet" "web" {
  address_prefixes     = ["10.100.0.0/24"]
  virtual_network_name = azurerm_virtual_network.primary.name
  name                 = "web"
  resource_group_name  = azurerm_resource_group.ntier.name
  depends_on           = [azurerm_virtual_network.primary]
}

resource "azurerm_subnet" "business" {
  address_prefixes     = ["10.100.1.0/24"]
  virtual_network_name = azurerm_virtual_network.primary.name
  name                 = "business"
  resource_group_name  = azurerm_resource_group.ntier.name
  depends_on           = [azurerm_virtual_network.primary]
}

resource "azurerm_subnet" "data" {
  address_prefixes     = ["10.100.2.0/24"]
  virtual_network_name = azurerm_virtual_network.primary.name
  name                 = "data"
  resource_group_name  = azurerm_resource_group.ntier.name
  depends_on           = [azurerm_virtual_network.primary]
}