resource "aws_vpc" "ntier" {
    cidr_block      = var.network_cidr
    tags            = {
        Name        = "ntier"
    } 
}


// for (i=0 ; i < 6 ; i++) {
//  resource "aws_subnet" "subnets" {
//      cidr_block      = var.subnet_cidrs[i]
//      availability_zone = var.subnet_azs[i]
//      vpc_id          = aws_vpc.ntier.id
//        tags            = {
//        Name        = var.subnet_name_tags[i]
//    } 
//  }
//}

resource "aws_subnet" "subnets" {
    count           = 6 
    cidr_block      = var.subnet_cidrs[count.index] 
    tags            = {
        Name        = var.subnet_name_tags[count.index]
    } 
    availability_zone = var.subnet_azs[count.index]
    vpc_id          = aws_vpc.ntier.id 
}


resource "aws_internet_gateway" "ntier_igw" {
    vpc_id          = aws_vpc.ntier.id
    tags            = {
        Name        = "ntier-igw"
    } 
  
}

resource "aws_s3_bucket" "my_bucket" {
    bucket          = var.bucket_name 
  
}

