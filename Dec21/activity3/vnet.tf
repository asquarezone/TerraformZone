resource "azurerm_virtual_network" "ntier" {
    name                = "ntier"
    resource_group_name = local.resource_group_name
    address_space       = [var.vnet_range]
    location            = var.region
    tags                = {
        Env             = "Development"
    } 
    # explicit dependency
    depends_on = [
      azurerm_resource_group.ntierrg
    ]
}


resource "azurerm_subnet" "subnets" {
    resource_group_name     = local.resource_group_name
    virtual_network_name    = azurerm_virtual_network.ntier.name
    address_prefixes        = [cidrsubnet(var.vnet_range,8,count.index)]
    name                    = var.subnet_names[count.index]
    count                   = length(var.subnet_names)

    depends_on = [
      azurerm_virtual_network.ntier
    ]

  
}