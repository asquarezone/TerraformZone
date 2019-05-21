
resource "aws_instance" "web_instance" {
    ami = "ami-0a313d6098716f372"
    instance_type = "t2.micro"
    key_name = "vpclearn"
    subnet_id = "${aws_subnet.web.id}"

    tags {
        Name = "web"
    }  
}

resource "aws_instance" "db_instance" {
    ami = "ami-0a313d6098716f372"
    instance_type = "t2.micro"
    key_name = "vpclearn"
    subnet_id = "${aws_subnet.db.id}"

    tags {
        Name = "db"
    }  
}

resource "aws_instance" "business_instance" {
    ami = "ami-0a313d6098716f372"
    instance_type = "t2.micro"
    key_name = "vpclearn"
    subnet_id = "${aws_subnet.business.id}"

    tags {
        Name = "business"
    }  
}
