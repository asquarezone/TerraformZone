resource "azurerm_resource_group" "rg" {
    name = "ntier"
    location = "eastus"
}


resource "azurerm_virtual_network" "primarynet" {
    name = "ntier-primary"
    resource_group_name = "ntier"
    address_space = [ "10.100.0.0/16" ]
    location = "eastus"
  
}

resource "azurerm_subnet" "web" {
    name = "web"
    resource_group_name = "ntier"
    virtual_network_name = "ntier-primary"
    address_prefixes = [ "10.100.0.0/24" ]
  
}

resource "azurerm_subnet" "business" {
    name = "business"
    resource_group_name = "ntier"
    virtual_network_name = "ntier-primary"
    address_prefixes = [ "10.100.1.0/24" ]
  
}

resource "azurerm_subnet" "data" {
    name = "data"
    resource_group_name = "ntier"
    virtual_network_name = "ntier-primary"
    address_prefixes = [ "10.100.2.0/24" ]
  
}