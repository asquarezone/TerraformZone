data "azurerm_subnet" "appsubnet" {
    resource_group_name             = azurerm_resource_group.infra_rg.name
    virtual_network_name            = azurerm_virtual_network.ntier.name
    name                            = var.appsubnet

    depends_on = [
      azurerm_subnet.subnets
    ]
  
}


# network interface

resource "azurerm_network_interface" "appnic" {
    count                           = var.createapp ? 1 : 0 
    name                            = "appnic"
    resource_group_name             = azurerm_resource_group.infra_rg.name
    location                        = azurerm_resource_group.infra_rg.location
    ip_configuration {
      name                          = "appipconfig"
      subnet_id                     = data.azurerm_subnet.appsubnet.id
      private_ip_address_allocation = "Dynamic"
    }
}


resource "azurerm_network_interface_security_group_association" "appnsgassociation" {
    count                           = var.createapp ? 1 : 0 
    network_interface_id            = azurerm_network_interface.appnic[0].id
    network_security_group_id       = azurerm_network_security_group.app_nsg.id
}


resource "azurerm_linux_virtual_machine" "appserver" {
    count                           = var.createapp ? 1 : 0 
    name                            = "appserver"
    resource_group_name             = azurerm_resource_group.infra_rg.name
    location                        = azurerm_resource_group.infra_rg.location
    size                            = var.vmsize
    admin_username                  = "qtdevops" 
    admin_password                  = "motherindia@123"
    network_interface_ids           = [azurerm_network_interface.appnic[0].id] 
    disable_password_authentication = false

    source_image_reference {
        publisher                   = "Canonical"
        offer                       = "0001-com-ubuntu-server-focal"
        sku                         = "20_04-lts-gen2"
        version                     = "latest"
    }

    os_disk {
        caching                     = "ReadWrite"
        storage_account_type        = "Standard_LRS"
  }
  
}