# creating a resource group

resource "azurerm_resource_group" "ntierrg" {
    name = "ntier"
    location = var.location
    tags = {
      "environment" = "Developer"
    }
}

resource "azurerm_virtual_network" "ntiervnet" {
    name = "ntier-vnet"
    resource_group_name = azurerm_resource_group.ntierrg.name
    address_space = [ var.address_space ]
    location = var.location

    depends_on = [
      azurerm_resource_group.ntierrg
    ]
    tags = {
      "environment" = "Developer"
    }
}

resource "azurerm_subnet" "subnets" {
    count = length(var.subnets)

    name = var.subnets[count.index]
    resource_group_name = azurerm_resource_group.ntierrg.name
    virtual_network_name = azurerm_virtual_network.ntiervnet.name
    address_prefixes = [cidrsubnet(var.address_space,8,count.index)]

    depends_on = [
      azurerm_virtual_network.ntiervnet
    ]
  
}

resource "azurerm_public_ip" "webpublicip" {

    
    name = local.publicipname
    resource_group_name = azurerm_resource_group.ntierrg.name
    location = var.location
    allocation_method = "Dynamic"

    tags = {
      "environment" = "Developer"
    }
  
}

resource "azurerm_network_interface" "webnic" {
    

    name = local.webnic
    resource_group_name = azurerm_resource_group.ntierrg.name
    location = var.location
    ip_configuration {
        name = "${local.webnic}config"
        subnet_id = azurerm_subnet.subnets[0].id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.webpublicip.id

    }
    tags = {
      "environment" = "Developer"
    }

    depends_on = [
        azurerm_public_ip.webpublicip
    ]

  
}

resource "azurerm_network_security_group" "webnsg" {
    
    name = local.webnsg
    resource_group_name = azurerm_resource_group.ntierrg.name
    location = var.location

    tags = {
      "environment" = "Developer"
    }  
  
}

resource "azurerm_network_security_rule" "openssh" {

    resource_group_name = azurerm_resource_group.ntierrg.name
    network_security_group_name = azurerm_network_security_group.webnsg.name
    name                        = local.sshrule
    priority                    = 1000
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "22"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"

    depends_on = [
      azurerm_network_security_group.webnsg
    ]

  
}

resource "azurerm_network_security_rule" "openhttp" {
    resource_group_name = azurerm_resource_group.ntierrg.name
    network_security_group_name = azurerm_network_security_group.webnsg.name
    name                        = local.httprule
    priority                    = 1010
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "80"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"

    depends_on = [
      azurerm_network_security_group.webnsg
    ]
  
}


resource "azurerm_network_interface_security_group_association" "webnsgassociation" {
    
    network_interface_id = azurerm_network_interface.webnic.id
    network_security_group_id = azurerm_network_security_group.webnsg.id
  
}

resource "azurerm_linux_virtual_machine" "webvm" {
    count = var.enable_vm ? 1: 0
    name = local.webvm
    resource_group_name = azurerm_resource_group.ntierrg.name
    location = var.location
    admin_username = var.username
    admin_password = var.password
    disable_password_authentication = false

    network_interface_ids = [azurerm_network_interface.webnic.id]
    size = "Standard_B1s"

    os_disk {
        name = local.webvmdisk
        caching = "ReadWrite"
        storage_account_type = "Premium_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer = "UbuntuServer"
        sku = "18.04-LTS"
        version = "latest"
      
    }

    tags = {
      "environment" = "Developer"
    }

    depends_on = [
      azurerm_subnet.subnets,
      azurerm_network_interface.webnic,
      azurerm_network_security_group.webnsg
    ]

  
}