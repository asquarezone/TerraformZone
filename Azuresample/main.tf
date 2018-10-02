# Execute the foolowing steps to get the id's
# az login
# az ad sp create-for-rbac --query "{ client_id: appId, client_secret: password, tenant_id: tenant }"
# az account show --query "{ subscription_id: id }"
variable "subscriptionid" {

}

variable "clientid" {

}

variable "clientsecret" {

}
variable "tenantid" {

}

variable "location" {
  default = "Central US"
}





provider "azurerm" {
   subscription_id = "${var.subscriptionid}"
   client_id       = "${var.clientid}"
   client_secret   = "${var.clientsecret}"
   tenant_id       = "${var.tenantid}"
}

resource "azurerm_resource_group" "rsg" {
    name = "terraform"
    location = "${var.location}"
    tags {
    environment = "Test"
  }
}

resource "azurerm_virtual_network" "tfvnet" {
    name = "terraformvnet"
    resource_group_name = "${azurerm_resource_group.rsg.name}"
    address_space = ["192.168.0.0/16"]
    location = "${var.location}"

}

resource "azurerm_subnet" "terraformcompute" {
    name                 = "terraformcompute"
  virtual_network_name = "${azurerm_virtual_network.tfvnet.name}"
   resource_group_name = "${azurerm_resource_group.rsg.name}"
  address_prefix       = "192.168.0.0/24"

}


resource "azurerm_public_ip" "publicip" {
    name = "terraformip"
    resource_group_name = "${azurerm_resource_group.rsg.name}"
    location = "${var.location}"
    public_ip_address_allocation = "dynamic"

}

resource "azurerm_network_interface" "terraformnic" {
  name                = "terraformnic"
  resource_group_name = "${azurerm_resource_group.rsg.name}"
  location = "${var.location}"

  ip_configuration {
    name                          = "terraformipconfig"
    subnet_id                     = "${azurerm_subnet.terraformcompute.id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.publicip.id}"
  }
}

resource "azurerm_virtual_machine" "myvm" {
    name = "terraformdevops"
    resource_group_name = "${azurerm_resource_group.rsg.name}"
    location = "${var.location}"
    network_interface_ids = ["${azurerm_network_interface.terraformnic.id}"]
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
        computer_name  = "terraformdevops"
        admin_username = "qtdevops"
        admin_password = "motherindia@123"
    }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  provisioner "remote-exec" {
    connection {
      user     = "qtdevops"
      password = "motherindia@123"
    }

    inline = [
      "sudo apt-get update",
      "sudo apt-get install apache2 -y"
    ]
  }
}

output "machineip" {
  value = "${azurerm_public_ip.publicip.ip_address}"
}