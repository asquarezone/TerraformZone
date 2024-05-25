resource "azurerm_linux_virtual_machine_scale_set" "preschool" {
  name                            = "preschool-vmss"
  location                        = azurerm_resource_group.preschool.location
  resource_group_name             = azurerm_resource_group.preschool.name
  sku                             = "Standard_B1s"
  admin_username                  = "Dell"
  admin_password                  = "qualitythought@1234"
  disable_password_authentication = false
  upgrade_mode                    = "Manual"
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
  network_interface {
    name = "preschool-nic"
    ip_configuration {
      name                                   = "internal"
      subnet_id                              = tolist(azurerm_virtual_network.preschool.subnet)[0].id
      load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.preschool.id]
    }
  }
  custom_data = filebase64("install.sh")


}