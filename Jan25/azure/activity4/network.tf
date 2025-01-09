resource "azurerm_virtual_network" "base" {
  name                = "${var.purpose}-vnet"
  address_space       = var.network_info.address_space
  location            = var.location
  resource_group_name = azurerm_resource_group.base.name
  depends_on          = [azurerm_resource_group.base]
}

resource "azurerm_subnet" "subnets" {
  for_each             = var.network_info.subnets
  name                 = each.key
  address_prefixes     = [each.value]
  virtual_network_name = azurerm_virtual_network.base.name
  resource_group_name  = azurerm_resource_group.base.name
  depends_on           = [azurerm_virtual_network.base]
}

# public ip
resource "azurerm_public_ip" "base" {
  name                = "${var.purpose}-ip"
  resource_group_name = azurerm_resource_group.base.name
  location            = azurerm_resource_group.base.location
  allocation_method   = "Static"

  depends_on = [azurerm_resource_group.base]
}

# network interface

resource "azurerm_network_interface" "web" {
  name                = "webnic"
  location            = var.location
  resource_group_name = azurerm_resource_group.base.name
  ip_configuration {
    name                          = "web"
    subnet_id                     = azurerm_subnet.subnets[var.webserver_subnet].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.base.id
  }

  depends_on = [azurerm_subnet.subnets, azurerm_public_ip.base]

}

resource "azurerm_network_interface_security_group_association" "nsgtonic" {
  network_interface_id      = azurerm_network_interface.web.id
  network_security_group_id = azurerm_network_security_group.web.id

}

