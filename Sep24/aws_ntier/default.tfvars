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
