resource "azurerm_linux_virtual_machine" "web" {
  name                = "web-1"
  resource_group_name = azurerm_resource_group.base.name
  location            = azurerm_resource_group.base.location
  size                = "Standard_B1s"
  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  admin_username = "Dell"
  admin_ssh_key {
    username   = "Dell"
    public_key = file("~/.ssh/id_rsa.pub")

  }
  network_interface_ids = [azurerm_network_interface.web.id]
  depends_on            = [azurerm_network_interface.web]

}
