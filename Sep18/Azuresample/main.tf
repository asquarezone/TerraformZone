provider "azurerm" {
  subscription_id = "58376b06-f20d-4a7a-a75d-cbd03b2135a6"
  client_id = "db3e33f1-b8d5-41fd-9b07-eb409c979640"
  client_secret = "6f7d4d17-2731-40c1-924e-895d5b07fc75"
  tenant_id = "aeefb57f-cec2-4491-bf00-268b13adf57b"
}


resource "azurerm_resource_group" "tf" {
  name = "terraform"
  location = "Central US"
}

resource "azurerm_virtual_network" "tfvnet" {
    name = "tfvnet"
    location = "Central US"
    resource_group_name = "${azurerm_resource_group.tf.name}"
    address_space = ["192.168.0.0/16"]
}

resource "azurerm_subnet" "tfsubnet" {
    name = "tfsubnet"
    resource_group_name = "${azurerm_resource_group.tf.name}"
    address_prefix = "192.168.0.0/24"
    virtual_network_name = "${azurerm_virtual_network.tfvnet.name}"
    
}

resource "azurerm_public_ip" "publicip" {
    name = "terraformpip"
    location = "Central US"
    resource_group_name = "${azurerm_resource_group.tf.name}"
    public_ip_address_allocation = "Dynamic"
}


resource "azurerm_network_interface" "mynic" {
    name = "terraformnic"
    location = "Central US"
    resource_group_name = "${azurerm_resource_group.tf.name}"

    ip_configuration {
        name = "myconf"
        subnet_id = "${azurerm_subnet.tfsubnet.id}"
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = "${azurerm_public_ip.publicip.id}"
    }

  
}

resource "azurerm_virtual_machine" "tfcompute" {
    name = "tfcompute"
    location = "Central US"
    resource_group_name = "${azurerm_resource_group.tf.name}"
    network_interface_ids = ["${azurerm_network_interface.mynic.id}"]
    vm_size               = "Standard_B1s"

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04-LTS"
        version   = "latest"
    }

    storage_os_disk {
        name              = "myosdisk1"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Standard_LRS"
    }

    os_profile {
        computer_name  = "tfcompute"
        admin_username = "qtdevops"
        admin_password = "motherindia@123"
    }

    os_profile_linux_config {
        disable_password_authentication = false
    }
  
}





