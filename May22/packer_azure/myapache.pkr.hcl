packer {
    required_plugins {
    azure = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/azure"
    }
    }
}

source "azure-arm" "basic-example" {
  use_azure_cli_auth = true
  resource_group_name = "fortf"
  storage_account = "qttfstatestorage"

  capture_container_name = "images"
  capture_name_prefix = "packer"

  os_type = "Linux"
  image_publisher = "Canonical"
  image_offer = "UbuntuServer"
  image_sku = "18.04-LTS"

  location = "Central US"
  vm_size = "Standard_B1s"
}

build {
  name    = "learn-packer"
  sources = [
    "source.azure-arm.basic-example"
  ]

  provisioner "shell" {
    environment_vars = [
      "FOO=hello world",
    ]
    inline = [
      "echo Installing Apache2",
      "sleep 30",
      "sudo apt-get update",
      "sudo apt-get install -y apache2",
    ]
  }
}