resource "aws_vpc" "ntiervpc" {
    cidr_block = var.ntier_cidr

    tags = {
      "Name" = "ntier"
    }
  
}
# aws_vpc.ntiervpc.id

# depending on subnet cidr variables
resource "aws_subnet" "subnets" {
   
   count = length(var.ntier_subnet_azs)

   cidr_block = cidrsubnet(var.ntier_cidr, 8, count.index)
   availability_zone = var.ntier_subnet_azs[count.index]
   tags = {
      "Name" = var.ntier_subnet_tags[count.index]
    }
    vpc_id = aws_vpc.ntiervpc.id
  
}

# Create an internet gateway and attach to vpc

resource "aws_internet_gateway" "ntier-igw" {
  vpc_id = aws_vpc.ntiervpc.id

  tags = {
    "Name" = "ntier-igw"
  }
  
}

