data "azurerm_subnet" "mysubnetquery" {
    name = "web-1"
    virtual_network_name = "ntier" 
    resource_group_name = "${azurerm_resource_group.ntier.name}" 
}
