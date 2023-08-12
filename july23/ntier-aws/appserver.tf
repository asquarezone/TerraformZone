resource "aws_key_pair" "private" {
  key_name   = "ntier"
  public_key = file(var.public_key_path)
  tags = {
    CreatedBy = "terraform"
  }
}

data "aws_subnet" "app" {
  filter {
    name   = "tag:Name"
    values = [var.app_subnet_name]
  }

  depends_on = [
    aws_subnet.subnets
  ]

}

resource "aws_instance" "appserver" {
  ami                         = var.ubuntu_ami_id
  associate_public_ip_address = true
  instance_type               = var.app_ec2_size
  key_name                    = aws_key_pair.private.key_name
  vpc_security_group_ids      = [aws_security_group.appsg.id]
  subnet_id                   = data.aws_subnet.app.id
  tags = {
    Name = "appserver"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "./installjenkins.sh"
    destination = "/tmp/installjenkins.sh"

  }

  provisioner "remote-exec" {
    script = "/tmp/installjenkins.sh"
  }

  depends_on = [
    aws_subnet.subnets
  ]
}
