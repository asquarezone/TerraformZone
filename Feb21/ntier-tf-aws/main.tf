# we need to create a vpc resource
resource "aws_vpc" "ntiervpc" {
    cidr_block = var.vpccidr
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
      "Name" = "from tf"
    }
  
}

# Lets create all subnets
resource "aws_subnet" "subnets" {
  count = 6
  vpc_id = aws_vpc.ntiervpc.id
  cidr_block = cidrsubnet(var.vpccidr,8,count.index)
  availability_zone = "${var.region}${count.index%2 == 0?"a":"b"}"

  tags = {
      "Name" = local.subnets[count.index]
    }
  
  depends_on = [ 
      aws_vpc.ntiervpc
   ]
  
}

resource "aws_internet_gateway" "ntierigw" {
    vpc_id = aws_vpc.ntiervpc.id

    tags = {
      "Name" = local.igw_name
    }

    depends_on = [
      aws_vpc.ntiervpc
    ]
}

# Create a route table 
resource "aws_route_table" "publicrt" {
  vpc_id = aws_vpc.ntiervpc.id

  route {
    cidr_block = local.anywhere
    gateway_id = aws_internet_gateway.ntierigw.id
  } 

  depends_on = [ 
    aws_vpc.ntiervpc,
    aws_subnet.subnets[0],
    aws_subnet.subnets[1]
   ]

}

resource "aws_route_table_association" "webassociations" {
  count = 2
  route_table_id = aws_route_table.publicrt.id
  subnet_id =  aws_subnet.subnets[count.index].id

  depends_on = [ 
    aws_route_table.publicrt
   ]
  
}


