resource "azurerm_linux_virtual_machine" "webvm" {
  resource_group_name = var.resourcegroup_details.name
  location            = var.resourcegroup_details.location
  name = format("webvm-%s",terraform.workspace)
  size = "Standard_B1s"
  admin_username = "qtdevops"
  admin_password = "qttesting@1234"
  network_interface_ids = [
    azurerm_network_interface.web_nic.id
  ]
  disable_password_authentication = false
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

}

resource "null_resource" "cluster" {
  # Changes to any instance of the cluster requires re-provisioning
  triggers = {
    version = var.runningversion
  }

  # Bootstrap script can run on any instance of the cluster
  # So we just choose the first in this case
  

  provisioner "remote-exec" {
    # Bootstrap script called with private_ip of each node in the cluster
    inline = [
      "sudo apt update",
      "sudo apt install nginx -y"
    ]

    connection {
     host = azurerm_linux_virtual_machine.webvm.public_ip_address
     user = "qtdevops"
     password = "qttesting@1234"
     
    }
  }

  depends_on = [
    azurerm_linux_virtual_machine.webvm
  ]
}
