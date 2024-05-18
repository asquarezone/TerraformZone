network_info = {
  name = "ntier"
  cidr = "192.168.0.0/16"
}

public_subnets = [{
  name = "web1"
  az   = "ap-south-1a"
  cidr = "192.168.0.0/24"
  }, {
  name = "web2"
  az   = "ap-south-1b"
  cidr = "192.168.1.0/24"
  }
]

private_subnets = [{
  name = "db1"
  az   = "ap-south-1a"
  cidr = "192.168.2.0/24"
  }, {
  name = "db2"
  az   = "ap-south-1b"
  cidr = "192.168.3.0/24"
  }
]


security_group_info = {
  name        = "web"
  description = "rule for web server"
  vpc_id      = ""
  inbound_rules = [{
    cidr        = "0.0.0.0/0"
    port        = 22
    protocol    = "tcp"
    description = "open ssh"
    },
    {
      cidr        = "0.0.0.0/0"
      port        = 80
      protocol    = "tcp"
      description = "open http"
    }
  ]
  outbound_rules   = []
  allow_all_egress = true
}

web_instance_info = {
  name              = "web"
  size              = "t2.micro"
  ami               = "ami-05e00961530ae1b55"
  subnet_id         = ""
  security_group_id = ""
  key_name          = "my_idrsa"
}