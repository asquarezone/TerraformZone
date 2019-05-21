resource "aws_vpc" "ntiernetwork" {
    cidr_block = "10.10.0.0/16"

    tags {
        Name = "ntier"
    }
}

resource "aws_subnet" "web" {
    vpc_id = "${aws_vpc.ntiernetwork.id}"
    cidr_block = "10.10.0.0/24"

    tags {
        Name = "web"
    }
}


resource "aws_subnet" "business" {
    vpc_id = "${aws_vpc.ntiernetwork.id}"
    cidr_block = "10.10.1.0/24"

    tags {
        Name = "business"
    }
}


resource "aws_subnet" "db" {
    vpc_id = "${aws_vpc.ntiernetwork.id}"
    cidr_block = "10.10.2.0/24"

    tags {
        Name = "db"
    }
}

