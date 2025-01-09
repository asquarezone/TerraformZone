location = "centralindia"
purpose  = "ntier"
network_info = {
  address_space = ["10.10.0.0/16"]
  subnets = {
    web = "10.10.0.0/24"
    app = "10.10.1.0/24"
    db  = "10.10.2.0/24"
  }
}

nsg_info = {
  name = "webnsg"
  security_rules = [{
    name                   = "openssh"
    priority               = 1000
    destination_port_range = 22
    access                 = "Allow"
    }, {
    name                   = "openhttp"
    priority               = 1010
    destination_port_range = 80
    access                 = "Allow"
  }]
}

webserver_subnet = "web"

webserver_info = {
  name = "webnode-1"

}
