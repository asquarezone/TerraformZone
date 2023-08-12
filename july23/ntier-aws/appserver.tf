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

  depends_on = [
    aws_subnet.subnets,
    aws_route.igwroute
  ]
}


resource "null_resource" "script_executor" {

  provisioner "remote-exec" {
    inline = [
     "sudo apt update",
     "sudo apt install openjdk-11-jdk -y",
     "cd /tmp && wget https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar",
     "java -jar spring-petclinic-2.4.2.jar &",
     "sleep 20s"
    ]
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = aws_instance.appserver.public_ip
    }
  }
  triggers = {
    app_script_version = var.app_script_version
  }

  depends_on = [aws_instance.appserver]
}
