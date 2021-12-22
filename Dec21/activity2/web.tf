resource "aws_instance" "web_instance_1" {
  ami                           = "ami-0892d3c7ee96c0bf7"
  associate_public_ip_address   = true
  instance_type                 = "t2.micro" 
  key_name                      = "fortf" 
  vpc_security_group_ids        = [aws_security_group.websg.id]
  subnet_id                     = aws_subnet.subnets[0].id   
}