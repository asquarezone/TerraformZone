resource "azurerm_linux_virtual_machine" "web" {
  name                = var.webserver_info.name
  location            = var.location
  resource_group_name = azurerm_resource_group.base.name
  size                = var.webserver_info.size
  admin_username      = var.webserver_info.admin_username
  admin_ssh_key {
    username   = var.webserver_info.admin_username
    public_key = file(var.webserver_info.public_key_path)
  }
  network_interface_ids = [
    azurerm_network_interface.web.id
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  depends_on = [
    azurerm_network_interface.web,
    azurerm_network_security_group.web,
    azurerm_subnet.subnets,
    azurerm_public_ip.base
  ]

}

resource "null_resource" "web" {
  connection {
    host        = azurerm_linux_virtual_machine.web.public_ip_address
    type        = "ssh"
    user        = var.webserver_info.admin_username
    private_key = file(var.webserver_info.private_key_path)
  }
  provisioner "remote-exec" {
    script = "./install.sh"

  }

}