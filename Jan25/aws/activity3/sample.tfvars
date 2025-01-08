region       = "ap-south-1"
vpc_cidr     = "10.10.0.0/16"
network_name = "ntier"
private_subnets = [{
  name = "app-1"
  cidr = "10.10.0.0/24"
  az   = "ap-south-1a"
  }, {
  name = "app-2"
  cidr = "10.10.1.0/24"
  az   = "ap-south-1b"
}]

public_subnets = [{
  name = "web-1"
  cidr = "10.10.10.0/24"
  az   = "ap-south-1a"
  }, {
  name = "web-2"
  cidr = "10.10.11.0/24"
  az   = "ap-south-1b"
  }
]

web_security_group = {
  rules = [{
    from_port = 22
    to_port   = 22
    }, {
    from_port = 80
    to_port   = 80
  }]
}

db_security_group = {
  rules = [{
    from_port = 3306
    to_port   = 3306
    #cidr_ipv4 = "10.10.0.0/16"
  }]
}

key_file_info = {
  name = "mykeypair"
}

web_server_info = {
  name       = "nginx"
  ami_filter = {}

}
