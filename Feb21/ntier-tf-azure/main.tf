provider "azurerm" {

    features {
    }
  
}

resource "azurerm_resource_group" "ntierrg" {
    name = local.rgname
    location = var.location
}

resource "azurerm_virtual_network" "ntiervnet" {
    name = "ntiervnet"
    resource_group_name = local.rgname
    location = var.location
    address_space = [ var.ntiervnetrange ]

    depends_on = [
      azurerm_resource_group.ntierrg
    ]
  
}

resource "azurerm_subnet" "subnets" {
    count = length(var.subnets)

    name = var.subnets[count.index]
    resource_group_name = local.rgname
    virtual_network_name = azurerm_virtual_network.ntiervnet.name
    address_prefixes = [ cidrsubnet(var.ntiervnetrange,8,count.index) ]

    depends_on = [
      azurerm_virtual_network.ntiervnet
    ]

  
}

resource "azurerm_network_security_group" "webnsg" {
    name = local.webnsgname
    resource_group_name = local.rgname
    location = var.location

    security_rule  {
      access = "Allow"
      description = "allow ssh"
      destination_address_prefix = "*"
      destination_port_range = "22"
      direction = "Inbound"
      name = "SSH"
      priority = 1001
      protocol = "TCP"
      source_address_prefix = "*"
      source_port_range = "*"
    } 
    security_rule  {
      access = "Allow"
      description = "allow http"
      destination_address_prefix = "*"
      destination_port_range = "80"
      direction = "Inbound"
      name = "Http"
      priority = 1011
      protocol = "TCP"
      source_address_prefix = "*"
      source_port_range = "*"
    }
    security_rule  {
      access = "Allow"
      description = "allow https"
      destination_address_prefix = "*"
      destination_port_range = "443"
      direction = "Inbound"
      name = "Https"
      priority = 1021
      protocol = "TCP"
      source_address_prefix = "*"
      source_port_range = "*"
    } 

    depends_on = [
      azurerm_virtual_network.ntiervnet,
      azurerm_subnet.subnets
    ]

  
}

resource "azurerm_public_ip" "webpublicip" {
    name = local.webpublicipname
    resource_group_name = local.rgname
    location = var.location
    allocation_method = "Dynamic"

    depends_on = [
      azurerm_network_security_group.webnsg
    ]
  
}

resource "azurerm_network_interface" "vmnic" {
    name = local.nicname
    resource_group_name = local.rgname
    location = var.location

    ip_configuration {
      name = "webnicconfig"
      subnet_id = azurerm_subnet.subnets[0].id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.webpublicip.id
    }

    depends_on = [
        azurerm_public_ip.webpublicip,
        azurerm_network_security_group.webnsg,
        azurerm_subnet.subnets
      
    ]

  
}

resource "azurerm_network_interface_security_group_association" "web" {
    network_interface_id = azurerm_network_interface.vmnic.id
    network_security_group_id = azurerm_network_security_group.webnsg.id
  
}

resource "azurerm_storage_account" "mystorageaccount" {
    name = local.storaccountname
    resource_group_name = local.rgname
    location = var.location
    account_replication_type = "LRS"
    account_tier = "Standard"
  
}

resource "azurerm_linux_virtual_machine" "webvm" {
    name = local.webvmname
    resource_group_name = local.rgname
    location = var.location
    size = "Standard_B1s"
    admin_username = "qtdevops"
    admin_password = "motherindia@123"
    network_interface_ids = [ azurerm_network_interface.vmnic.id ]
    disable_password_authentication = false

    os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.mystorageaccount.primary_blob_endpoint
  }

 depends_on = [
   azurerm_storage_account.mystorageaccount,
   azurerm_network_interface.vmnic

 ]
  
}