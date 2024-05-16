# create a public ip address
resource "azurerm_public_ip" "web" {
  name                = "web"
  resource_group_name = azurerm_resource_group.group.name
  location            = azurerm_resource_group.group.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags = {
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }
  depends_on = [azurerm_resource_group.group]
}

# Create network security group
resource "azurerm_network_security_group" "web" {
  name                = "webnsg"
  resource_group_name = azurerm_resource_group.group.name
  location            = azurerm_resource_group.group.location
  tags = {
    Environment = "Dev"
    CreatedBy   = "Terraform"
  }

  depends_on = [azurerm_resource_group.group]
}


resource "azurerm_network_security_rule" "web" {
  count                       = length(var.web_nsg_rules)
  name                        = var.web_nsg_rules[count.index].name
  resource_group_name         = azurerm_resource_group.group.name
  network_security_group_name = azurerm_network_security_group.web.name
  description                 = var.web_nsg_rules[count.index].description
  protocol                    = var.web_nsg_rules[count.index].protocol
  source_port_range           = var.web_nsg_rules[count.index].source_port_range
  destination_port_range      = var.web_nsg_rules[count.index].destination_port_range
  source_address_prefix       = var.web_nsg_rules[count.index].source_address_prefix
  destination_address_prefix  = var.web_nsg_rules[count.index].destination_address_prefix
  access                      = var.web_nsg_rules[count.index].access
  priority                    = var.web_nsg_rules[count.index].priority
  direction                   = "Inbound"
  depends_on = [
    azurerm_resource_group.group,
    azurerm_network_security_group.web
  ]

}


# Creating network interface
resource "azurerm_network_interface" "web" {
  name                = "webnic"
  resource_group_name = azurerm_resource_group.group.name
  location            = azurerm_resource_group.group.location
  ip_configuration {
    name                          = "web"
    subnet_id                     = azurerm_subnet.subnets[0].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.web.id
  }

  depends_on = [
    azurerm_subnet.subnets,
    azurerm_public_ip.web
  ]

}


# associate network security group with network interface id
resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id      = azurerm_network_interface.web.id
  network_security_group_id = azurerm_network_security_group.web.id

  depends_on = [
    azurerm_network_interface.web,
    azurerm_network_security_group.web
  ]

}


resource "azurerm_linux_virtual_machine" "web" {
  name                = var.web_vm_info.name
  resource_group_name = azurerm_resource_group.group.name
  location            = azurerm_resource_group.group.location
  size                = var.web_vm_info.size
  admin_username      = var.web_vm_info.username
  admin_ssh_key {
    username   = var.web_vm_info.username
    public_key = file(var.web_vm_info.public_key_path)
  }
  network_interface_ids = [azurerm_network_interface.web.id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = var.web_vm_info.publisher
    offer     = var.web_vm_info.offer
    sku       = var.web_vm_info.sku
    version   = var.web_vm_info.version
  }

}
