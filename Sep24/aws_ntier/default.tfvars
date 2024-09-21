vpc_info = {
  cidr_block           = "10.100.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "ntier"
  }
}

public_subnets = [{
  cidr_block = "10.100.0.0/24"
  az         = "ap-south-1a"
  tags = {
    Name = "web-1"
  }
  }, {
  cidr_block = "10.100.1.0/24"
  az         = "ap-south-1b"
  tags = {
    Name = "web-2"
  }
}]

private_subnets = [{
  cidr_block = "10.100.2.0/24"
  az         = "ap-south-1a"
  tags = {
    Name = "app-1"
  }
  }, {
  cidr_block = "10.100.3.0/24"
  az         = "ap-south-1b"
  tags = {
    Name = "app-2"
  }
  }, {
  cidr_block = "10.100.4.0/24"
  az         = "ap-south-1a"
  tags = {
    Name = "db-1"
  }
  }, {
  cidr_block = "10.100.5.0/24"
  az         = "ap-south-1b"
  tags = {
    Name = "db-2"
  }
}]


web_security_group = {
  name        = "web"
  description = "this opens 80 and 22 port"
  inbound_rules = [{
    port        = 22
    protocol    = "tcp"
    source      = "0.0.0.0/0"
    description = "open ssh"
    }, {
    port        = 80
    protocol    = "tcp"
    source      = "0.0.0.0/0"
    description = "open http"
    }, {
    port        = 443
    protocol    = "tcp"
    source      = "0.0.0.0/0"
    description = "open https"
  }]

}

app_security_group = {
  name        = "app"
  description = "open 8000 port within vpc"
  inbound_rules = [{
    port        = 8000
    protocol    = "tcp"
    source      = "10.100.0.0/16"
    description = "open 8000 port"
  }]
}


db_security_group = {
  name        = "db"
  description = "open 3306 port within vpc"
  inbound_rules = [{
    port        = 3306
    protocol    = "tcp"
    source      = "10.100.0.0/16"
    description = "open 3306 port"
  }]
}
