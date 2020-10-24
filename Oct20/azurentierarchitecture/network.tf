resource "azurerm_resource_group" "ntier_resg" {
    name                = local.resg_name
    location            = local.resg_location
}

resource "azurerm_virtual_network" "ntier_vnet" {
    name                    = local.vnet_name
    resource_group_name     = local.resg_name
    location                = local.resg_location
    address_space           = [var.address_space]


    tags                    = {
        environment = "QA"
    }

    depends_on          = [
        azurerm_resource_group.ntier_resg
    ]
}

resource "azurerm_subnet" "subnets" {
    name                        = var.subnets[count.index]
    resource_group_name         = local.resg_name
    virtual_network_name        = local.vnet_name
    count                       = length(var.subnets)
    address_prefixes            = [ cidrsubnet(var.address_space,8,count.index) ]

    depends_on          = [
        azurerm_resource_group.ntier_resg,
        azurerm_virtual_network.ntier_vnet

    ]
}
