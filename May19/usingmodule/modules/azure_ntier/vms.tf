resource "azurerm_virtual_machine" "webserver01" {
    name = "qtwebserver01"
    resource_group_name = "${azurerm_resource_group.ntier.name}"
    location = "${azurerm_resource_group.ntier.location}"
    network_interface_ids = ["${azurerm_network_interface.webnic.id}"]
    vm_size = "Standard_B1s"

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04-LTS"
        version   = "latest"
    }

    storage_os_disk {
        name              = "myosdisk1"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Standard_LRS"
    }
    os_profile {
        computer_name  = "qtdevops"
        admin_username = "${var.username}"
        admin_password = "${var.password}"
    }
    os_profile_linux_config {
        disable_password_authentication = false
    }

    connection {
        type = "ssh"
        user = "${var.username}"
        password = "${var.password}"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo apt-get update",
            "sudo apt-get install apache2 -y"
        ]
    }
}
