resource "aws_instance" "web" {
  ami                         = var.web_instance_info.ami
  instance_type               = var.web_instance_info.size
  associate_public_ip_address = true
  key_name                    = var.web_instance_info.key_name
  subnet_id                   = aws_subnet.public[0].id
  vpc_security_group_ids = [
    aws_security_group.web.id
  ]
  tags = {
    Name = var.web_instance_info.name
  }
  user_data = file("install.sh")

  depends_on = [
    aws_subnet.private,
    aws_subnet.public,
    aws_security_group.web
  ]

}