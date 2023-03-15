resource "aws_vpc" "my_vpc" {
    cidr_block = "192.168.0.0/16"
    tags = {
        Name = "myvpc"
    }
  
}

resource "aws_subnet" "first_subnet" {
    vpc_id = aws_vpc.my_vpc.id # implicit dependecy
    cidr_block = "192.168.0.0/24"

    tags = {
      "Name" = "first subnet"
    }
    
    depends_on = [
      aws_vpc.my_vpc
    ]
  
}

resource "aws_subnet" "second_subnet" {
    vpc_id = aws_vpc.my_vpc.id # implicit dependecy
    cidr_block = "192.168.1.0/24"

    tags = {
      "Name" = "second subnet"
    }

    depends_on = [
      aws_vpc.my_vpc
    ]
  
}

resource "aws_subnet" "third_subnet" {
    vpc_id = aws_vpc.my_vpc.id # implicit dependecy
    cidr_block = "192.168.2.0/24"

    tags = {
      "Name" = "third subnet"
    }
    
    depends_on = [
      aws_vpc.my_vpc
    ]
}