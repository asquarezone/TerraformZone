resource "aws_vpc" "ntiervpc" {
    cidr_block = var.ntier_cidr

    tags = {
      "Name" = "ntier-${terraform.workspace}"
    }
  
}
# aws_vpc.ntiervpc.id

# depending on subnet cidr variables
resource "aws_subnet" "subnets" {
   
   count = length(var.ntier_subnet_azs)

   cidr_block = cidrsubnet(var.ntier_cidr, 8, count.index)
   availability_zone = var.ntier_subnet_azs[count.index]
   tags = {
      "Name" = "${var.ntier_subnet_tags[count.index]}-${terraform.workspace}"
    }
    vpc_id = aws_vpc.ntiervpc.id

    depends_on = [
      aws_vpc.ntiervpc
    ]
  
}

# Create an internet gateway and attach to vpc

resource "aws_internet_gateway" "ntierigw" {
  vpc_id = aws_vpc.ntiervpc.id

  tags = {
    "Name" = "ntier-igw-${terraform.workspace}"
  }

  depends_on = [
    aws_vpc.ntiervpc
  ]
  
}


