resource "azurerm_public_ip" "webip" {
  name                = "webip"
  resource_group_name = "testbicep"
  location            = "eastus"
  allocation_method   = "Static"
}


resource "azurerm_network_interface" "webnic" {
  name                = "webnic"
  resource_group_name = "testbicep"
  location            = "eastus"
  ip_configuration {
    name                          = "config1"
    subnet_id                     = data.azurerm_subnet.example.id
    public_ip_address_id          = azurerm_public_ip.webip.id
    private_ip_address_allocation = "Dynamic"
  }

}

resource "azurerm_network_interface_security_group_association" "nicsg" {
  network_interface_id      = azurerm_network_interface.webnic.id
  network_security_group_id = data.azurerm_network_security_group.openall.id

}

resource "azurerm_linux_virtual_machine" "apache" {
  name                = "apache"
  resource_group_name = "testbicep"
  location            = "eastus"
  size                = "Standard_B1s"
  admin_username      = "Dell"
  network_interface_ids = [
    azurerm_network_interface.webnic.id,
  ]

  admin_ssh_key {
    username   = "Dell"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }


}

resource "null_resource" "executor" {
  triggers = {
    rollout_version = var.rollout_version
  }

  connection {
    type        = "ssh"
    user        = azurerm_linux_virtual_machine.apache.admin_username
    private_key = file("~/.ssh/id_rsa")
    host        = azurerm_linux_virtual_machine.apache.public_ip_address
  }
  provisioner "remote-exec" {
    inline = ["sudo apt update", "sudo apt install apache2 -y", "sudo apt install openjdk-11-jdk -y"]
  }

}