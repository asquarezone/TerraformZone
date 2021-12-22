resource "aws_vpc" "primary_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
      Name = "primary"
  }
}


resource "aws_subnet" "subnets" {
  count = length(var.subnet_cidrs)

  vpc_id = aws_vpc.primary_vpc.id
  availability_zone = var.subnet_azs[count.index]
  cidr_block = var.subnet_cidrs[count.index]

  tags = {
      Name = var.subnet_names[count.index]
  }
}

# Web Security Groups

resource "aws_security_group" "websg" {
  vpc_id = aws_vpc.primary_vpc.id

  ingress {
    description = "Open SSH For all"
    from_port = local.ssh_port
    to_port = local.ssh_port
    protocol = local.tcp
    cidr_blocks = [ local.anywhere ]

  }

  ingress {
    description = "Open HTTP For all"
    from_port = local.http_port
    to_port = local.http_port
    protocol = local.tcp
    cidr_blocks = [ local.anywhere ]
  }

  ingress {
    from_port = local.https_port
    to_port = local.https_port
    protocol = local.tcp
    cidr_blocks = [ local.anywhere ]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [ local.anywhere ]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "WebSg" 
  }
  
}

resource "aws_security_group" "dbsg" {
  vpc_id = aws_vpc.primary_vpc.id

  ingress {
    description = "Open Postgres within VPC"
    from_port = local.pg_port
    to_port = local.pg_port
    protocol = local.tcp
    cidr_blocks = [ var.vpc_cidr ]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "DB Sg"
  }
  
}

# Creating internet gateway
resource "aws_internet_gateway" "ntier_igw" {
  tags      = {
    Name    = "ntier-igw"
  }
  vpc_id    = aws_vpc.primary_vpc.id
  
}

# create a route table
resource "aws_route_table" "public_rt" {
  vpc_id      = aws_vpc.primary_vpc.id
  tags        = {
    Name      = "public"
  }

  route {
    cidr_block = local.anywhere
    gateway_id = aws_internet_gateway.ntier_igw.id
  }
  
}

resource "aws_route_table" "private_rt" {
  vpc_id      = aws_vpc.primary_vpc.id
  tags        = {
    Name      = "private"
  }
  
}

# Associate public route table with web subnets

resource "aws_route_table_association" "web1_public_association" {
  route_table_id  = aws_route_table.public_rt.id
  subnet_id       = aws_subnet.subnets[0].id
}

resource "aws_route_table_association" "web2_public_association" {
  route_table_id  = aws_route_table.public_rt.id
  subnet_id       = aws_subnet.subnets[1].id
}

resource "aws_route_table_association" "db1_private_association" {
  route_table_id  = aws_route_table.private_rt.id
  subnet_id       = aws_subnet.subnets[2].id
}

resource "aws_route_table_association" "db2_private_association" {
  route_table_id  = aws_route_table.private_rt.id
  subnet_id       = aws_subnet.subnets[3].id
}