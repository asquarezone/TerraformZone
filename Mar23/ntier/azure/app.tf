resource "azurerm_network_interface" "appserver_nic" {
  name                = "appservernic"
  location            = azurerm_resource_group.ntierrg.location
  resource_group_name = azurerm_resource_group.ntierrg.name

  ip_configuration {
    name      = "appserverip"
    subnet_id = azurerm_subnet.subnets[var.appsubnet_index].id
    private_ip_address_allocation = "Dynamic"
  }

  depends_on = [
    azurerm_subnet.subnets
  ]

}

resource "azurerm_linux_virtual_machine" "appserver" {
  name                = "appserver1"
  location            = azurerm_resource_group.ntierrg.location
  resource_group_name = azurerm_resource_group.ntierrg.name
  admin_username      = "qtdevops"
  admin_password      = "ThisPasswordisnotgreat@1"
  disable_password_authentication = false
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
  size = "Standard_B1s"
  network_interface_ids = [
    azurerm_network_interface.appserver_nic.id
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  depends_on = [
    azurerm_network_interface.appserver_nic
  ]
}