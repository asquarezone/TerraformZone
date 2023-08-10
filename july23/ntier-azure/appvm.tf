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