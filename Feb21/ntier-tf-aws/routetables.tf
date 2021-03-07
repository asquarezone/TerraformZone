# This creates the internet gateway
resource "aws_internet_gateway" "ntierigw" {
    vpc_id = aws_vpc.ntiervpc.id

    tags = {
      "Name" = local.igw_name
    }

    depends_on = [
      aws_vpc.ntiervpc
    ]
}

# Create a public route table 
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

   tags = {
      "Name" = "publicrt"
    }

}

# Create public route table associations
resource "aws_route_table_association" "webassociations" {
  count = 2
  route_table_id = aws_route_table.publicrt.id
  subnet_id =  aws_subnet.subnets[count.index].id

  depends_on = [ 
    aws_route_table.publicrt
   ]
  
}

# create private route table
resource "aws_route_table" "privatert" {
  vpc_id = aws_vpc.ntiervpc.id
  tags = {
      "Name" = "privatert"
    }

  depends_on = [ 
    aws_vpc.ntiervpc,
    aws_subnet.subnets[2],
    aws_subnet.subnets[3],
    aws_subnet.subnets[4],
    aws_subnet.subnets[5],
   ]

  
}


# create private route table associations
resource "aws_route_table_association" "privateassociation" {

  count = 4
  route_table_id = aws_route_table.privatert.id
  subnet_id =  aws_subnet.subnets[count.index + 2].id

  depends_on = [ 
    aws_route_table.privatert
   ]

}