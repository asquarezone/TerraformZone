resource "azurerm_public_ip" "app" {
  name                = "apppip"
  resource_group_name = azurerm_resource_group.ntier.name
  location            = azurerm_resource_group.ntier.location
  allocation_method   = "Static"
}

data "azurerm_subnet" "app" {
  name                 = var.appvm_config.subnet_name
  virtual_network_name = azurerm_virtual_network.ntier_vnet.name
  resource_group_name  = azurerm_resource_group.ntier.name
  depends_on           = [azurerm_subnet.subnets]
}

resource "azurerm_network_interface" "app" {
  name                = "appnic"
  resource_group_name = azurerm_resource_group.ntier.name
  location            = azurerm_resource_group.ntier.location
  ip_configuration {
    name                          = "appipconfig"
    subnet_id                     = data.azurerm_subnet.app.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.app.id
  }
  depends_on = [
    azurerm_subnet.subnets,
    azurerm_network_security_group.appnsg,
    azurerm_public_ip.app,
    data.azurerm_subnet.app
  ]

}

resource "azurerm_network_interface_security_group_association" "appnsg" {
  network_interface_id      = azurerm_network_interface.app.id
  network_security_group_id = azurerm_network_security_group.appnsg.id
  depends_on = [
    azurerm_network_interface.app,
    azurerm_network_security_group.appnsg
  ]
}


resource "azurerm_linux_virtual_machine" "app" {
  name                = "app"
  resource_group_name = azurerm_resource_group.ntier.name
  location            = azurerm_resource_group.ntier.location
  size                = var.appvm_config.size
  admin_username      = var.appvm_config.username
  admin_ssh_key {
    username   = var.appvm_config.username
    public_key = file(var.appvm_config.keypath)
  }
  network_interface_ids = [azurerm_network_interface.app.id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = var.appvm_config.publisher
    offer     = var.appvm_config.offer
    sku       = var.appvm_config.sku
    version   = var.appvm_config.version

  }
}

resource "null_resource" "script_executor" {

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install openjdk-11-jdk -y",
      "cd /tmp && wget https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar",
      "java -jar spring-petclinic-2.4.2.jar &",
      "sleep 20s"
    ]
    connection {
      type        = "ssh"
      user        = var.appvm_config.username
      private_key = file(var.appvm_config.private_key_path)
      host        = azurerm_linux_virtual_machine.app.public_ip_address
    }
  }
  triggers = {
    app_script_version = var.app_script_version
  }

  depends_on = [azurerm_linux_virtual_machine.app]
}
