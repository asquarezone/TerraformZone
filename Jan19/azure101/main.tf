provider "azurerm" {
  subscription_id ="${var.subscription_id}"
  client_id = "${var.app_id}"
  environment = "${var.azureenvironment}"
  tenant_id = "${var.tenantid}"
  client_secret = "${var.password}"
}

resource "azurerm_resource_group" "fromtf" {
  name     = "terraform"
  location = "Central US"
}

resource "azurerm_virtual_network" "myfirstvnet" {
  resource_group_name = "${azurerm_resource_group.fromtf.name}"
  name = "vnetfromtf"
  address_space = ["192.168.0.0/16"]
  location = "Central US"
  
}


resource "azurerm_subnet" "myterraformsubnet" {
    name                 = "subnet1"
    resource_group_name  = "${azurerm_resource_group.fromtf.name}"
    virtual_network_name = "${azurerm_virtual_network.myfirstvnet.name}"
    address_prefix       = "192.168.0.0/24"
}

resource "azurerm_network_security_group" "mysecuritygroup" {
  name = "sgfromtf"
  resource_group_name = "${azurerm_resource_group.fromtf.name}"
  location = "Central US"
  security_rule {
    name                       = "inbound1"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "outbound1"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "main" {
  name                = "my-nic"
  location            = "Central Us"
  resource_group_name = "${azurerm_resource_group.fromtf.name}"

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = "${azurerm_subnet.myterraformsubnet.id}"
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_virtual_machine" "myvm" {
  name = "qtdevops"
  resource_group_name = "${azurerm_resource_group.fromtf.name}"
  location = "Central US"
  network_interface_ids = ["${azurerm_network_interface.main.id}"]
  vm_size = "Standard_B1s"
  storage_os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04.0-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = "myvm"
        admin_username = "qtdevops"
        admin_password = "motherindia@123"
    }

    os_profile_linux_config {
      disable_password_authentication = false
    }

}


