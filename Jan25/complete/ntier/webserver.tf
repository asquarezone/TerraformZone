data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}



resource "aws_instance" "web" {
  count                       = var.web_server_info.count
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.web_server_info.size
  key_name                    = var.web_server_info.key_pair
  associate_public_ip_address = true
  vpc_security_group_ids      = [module.http_sg.security_group_id]
  subnet_id                   = module.vpc.public_subnets[count.index]
  tags = {
    Name = var.web_server_info.name
  }


}

resource "null_resource" "web" {
  count = var.web_server_info.count
  triggers = {
    build_id = var.build_id
  }
  connection {
    type        = "ssh"
    host        = aws_instance.web[count.index].public_ip
    user        = var.web_server_info.username
    private_key = file(var.web_server_info.private_key_path)
  }
  provisioner "remote-exec" {
    script = "install.sh"
  }

}