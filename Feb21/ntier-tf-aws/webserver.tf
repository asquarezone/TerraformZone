resource "aws_instance" "webserver1" {
    ami = "ami-0ca5c3bd5a268e7db"
    associate_public_ip_address = true
    instance_type = "t2.micro"
    key_name = "terraform"
    security_groups = [ aws_security_group.websg.id ]
    subnet_id = aws_subnet.subnets[0].id
    tags = {
      "Name" = "webserver 1"
    }
    depends_on = [ aws_db_instance.ntierdb ]
  
}