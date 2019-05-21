resource "azurerm_public_ip" "web" {
    name = "webipaddress"
    resource_group_name = "${azurerm_resource_group.ntier.name}"
    location = "${azurerm_resource_group.ntier.location}"
    allocation_method = "Dynamic"

  
}

resource "azurerm_network_security_group" "web" {
    name = "webnsg"
    resource_group_name = "${azurerm_resource_group.ntier.name}"
    location = "${azurerm_resource_group.ntier.location}"

    security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}


resource "azurerm_network_interface" "webnic" {
    name = "webnic"
    resource_group_name = "${azurerm_resource_group.ntier.name}"
    location = "${azurerm_resource_group.ntier.location}"
    network_security_group_id = "${azurerm_network_security_group.web.id}"

    ip_configuration {
        name = "webnic_ipconf"
        subnet_id = "${azurerm_subnet.web.id}"
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = "${azurerm_public_ip.web.id}"
    }
}



