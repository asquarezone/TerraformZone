resource "azurerm_linux_virtual_machine" "web" {
  name                            = "web"
  location                        = var.location
  resource_group_name             = azurerm_resource_group.ntier.name
  size                            = "Standard_B1s"
  admin_username                  = "qtdevops"
  admin_password                  = "qtadministration@1234"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.webnic.id
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

}


resource "azurerm_linux_virtual_machine" "business" {
  name                            = "business"
  location                        = var.location
  resource_group_name             = azurerm_resource_group.ntier.name
  size                            = "Standard_B1s"
  admin_username                  = "qtdevops"
  admin_password                  = "qtadministration@1234"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.businessnic.id
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

}


resource "azurerm_linux_virtual_machine" "data" {
  name                            = "data"
  location                        = var.location
  resource_group_name             = azurerm_resource_group.ntier.name
  size                            = "Standard_B1s"
  admin_username                  = "qtdevops"
  admin_password                  = "qtadministration@1234"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.datanic.id
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

}