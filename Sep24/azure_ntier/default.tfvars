resource_group_info = {
  name     = "ntier"
  location = "eastus"
}

network_info = {
  name          = "ntier"
  address_space = ["192.168.0.0/16"]
}

subnets_info = [{
  name          = "web"
  address_space = ["192.168.0.0/24"]
  }, {
  name          = "app"
  address_space = ["192.168.1.0/24"]
  }, {
  name          = "db"
  address_space = ["192.168.2.0/24"]
}]