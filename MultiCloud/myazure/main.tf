provider "azurerm" {
  client_id       = "${var.clientid}"
  client_secret   = "${var.password}"
  tenant_id       = "${var.tenantid}"
  subscription_id = "${var.subscriptionid}"
}

resource "azurerm_resource_group" "terraform" {
  name     = "terraform"
  location = "centralus"

  tags {
    environment = "test"
  }
}

resource "azurerm_virtual_network" "terraform" {
  name                = "acctvn"
  address_space       = ["10.0.0.0/16"]
  location            = "${azurerm_resource_group.terraform.location}"
  resource_group_name = "${azurerm_resource_group.terraform.name}"
}

resource "azurerm_subnet" "terraform" {
  name                 = "acctsub"
  resource_group_name  = "${azurerm_resource_group.terraform.name}"
  virtual_network_name = "${azurerm_virtual_network.terraform.name}"
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_public_ip" "terraform" {
  name                         = "test-pip"
  location                     = "${azurerm_resource_group.terraform.location}"
  resource_group_name          = "${azurerm_resource_group.terraform.name}"
  public_ip_address_allocation = "Dynamic"
  idle_timeout_in_minutes      = 30

  tags {
    environment = "test"
  }
}

resource "azurerm_network_interface" "terraform" {
  name                = "acctni"
  location            = "${azurerm_resource_group.terraform.location}"
  resource_group_name = "${azurerm_resource_group.terraform.name}"

  ip_configuration {
    name                          = "terraformconfiguration"
    subnet_id                     = "${azurerm_subnet.terraform.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${azurerm_public_ip.terraform.id}"
  }
}

resource "azurerm_managed_disk" "disk" {
  name                 = "datadisk_existing"
  location             = "${azurerm_resource_group.terraform.location}"
  resource_group_name  = "${azurerm_resource_group.terraform.name}"
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "20"
}

resource "azurerm_virtual_machine" "web" {
  name                  = "webserver"
  resource_group_name   = "${azurerm_resource_group.terraform.name}"
  location              = "${azurerm_resource_group.terraform.location}"
  network_interface_ids = ["${azurerm_network_interface.terraform.id}"]
  vm_size               = "Standard_DS1_v2"

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

  storage_data_disk {
    name            = "${azurerm_managed_disk.disk.name}"
    managed_disk_id = "${azurerm_managed_disk.disk.id}"
    create_option   = "Attach"
    lun             = 1
    disk_size_gb    = "${azurerm_managed_disk.disk.disk_size_gb}"
  }

  os_profile {
    computer_name  = "webserver"
    admin_username = "qtdevops"
    admin_password = "Password1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
