resource_group = {
  name     = "ntier-dev"
  location = "centralindia"
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

  }]
}