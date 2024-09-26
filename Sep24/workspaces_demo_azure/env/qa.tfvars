resource_group = {
  name     = "ntier-qa"
  location = "eastus"
}

network_info = {
  name          = "ntier"
  address_space = "10.0.0.0/16"
  subnets = [{
    name             = "web",
    address_prefixes = ["10.0.0.0/24"]

    }, {
    name             = "app",
    address_prefixes = ["10.0.1.0/24"]

    }, {
    name             = "db",
    address_prefixes = ["10.0.2.0/24"]

    }, {
    name             = "ad",
    address_prefixes = ["10.0.3.0/24"]

    }, {
    name             = "ApplicationGatewaySubnet",
    address_prefixes = ["10.0.255.0/24"]

  }]
}