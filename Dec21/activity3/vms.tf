resource "azurerm_linux_virtual_machine" "web1vm" {
    name                                = "qtweb1"
    resource_group_name                 = local.resource_group_name
    location                            = var.region
    network_interface_ids               = [azurerm_network_interface.web_nic.id] 
    size                                = "Standard_B1s"
    os_disk {
        caching                         = "ReadWrite"
        storage_account_type            = "Standard_LRS"
    }
    admin_username                      = "qtdevops"
    admin_password                      = "motherindia@123"
    disable_password_authentication     = false
    source_image_reference {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-focal"
        sku       = "20_04-lts-gen2"
        version   = "latest"
    }

    connection {
      type          = "ssh"
      user          = "qtdevops"
      password      = "motherindia@123" 
      host          = self.public_ip_address
    }

    provisioner "remote-exec" {
        inline = [
          "sudo apt update",
          "sudo apt install apache2 -y"
        ]
    }


    depends_on = [
      azurerm_network_interface.web_nic,
      azurerm_network_security_group.webnsg
    ]


  
}