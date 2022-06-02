// Create a resource group

resource "azurerm_resource_group" "infra_rg" {
    name        = "fromtf"
    location    = "South India" 
}

// create a virtual network
resource "azurerm_virtual_network" "ntier" {
    name                    = "ntier"
    resource_group_name     = azurerm_resource_group.infra_rg.name
    location                = azurerm_resource_group.infra_rg.location
    address_space           = var.network_cidr
}

// create multiple subnets

resource "azurerm_subnet" "subnets" {
    count                   = length(var.subnet_names)
    resource_group_name     = azurerm_resource_group.infra_rg.name
    virtual_network_name    = azurerm_virtual_network.ntier.name 
    name                    = var.subnet_names[count.index] 
    address_prefixes        = [cidrsubnet(var.network_cidr[0],8,count.index)]
  
}
