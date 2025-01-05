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