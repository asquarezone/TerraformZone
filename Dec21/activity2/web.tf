resource "aws_instance" "web_instance_1" {
  count                         = terraform.workspace == "UAT"?2:1
  ami                           = "ami-0892d3c7ee96c0bf7"
  associate_public_ip_address   = true
  instance_type                 = var.instance_type 
  key_name                      = "fortf" 
  vpc_security_group_ids        = [aws_security_group.websg.id]
  subnet_id                     = aws_subnet.subnets[count.index].id  

  tags = {
    Name = format("Web-%d", count.index),
    Env = terraform.workspace
  } 
}