resource "aws_instance" "this" {
  ami                         = var.instance_info.ami
  instance_type               = var.instance_info.size
  associate_public_ip_address = var.instance_info.associate_public_ip_address
  key_name                    = var.instance_info.key_name
  subnet_id                   = var.instance_info.subnet_id
  vpc_security_group_ids = [
    var.instance_info.security_group_id
  ]
  tags = {
    Name = var.instance_info.name
  }
  user_data = var.instance_info.user_data ? file(var.instance_info.user_data_file) : ""
}