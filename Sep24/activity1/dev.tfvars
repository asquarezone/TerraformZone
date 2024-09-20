vpc_config = {
  cidr_block = "192.168.0.0/16"
  tags = {
    Name = "ntier"
  }
}

subnets_config = [{
  cidr_block        = "192.168.0.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "web-1"
  }
  }, {
  cidr_block        = "192.168.1.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "web-2"
  }
  }, {
  cidr_block        = "192.168.2.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "app-1"
  }
  }, {
  cidr_block        = "192.168.3.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "app-2"
  }
}, {
  cidr_block        = "192.168.4.0/24"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "db-1"
  }
  }, {
  cidr_block        = "192.168.5.0/24"
  availability_zone = "ap-south-1b"
  tags = {
    Name = "db-2"
  }
}]
