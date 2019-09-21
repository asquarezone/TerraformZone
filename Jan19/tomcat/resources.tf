provider "aws" {
  access_key = "${var.myaccesskey}"
  secret_key = "${var.mysecretkey}"
  region = "${var.myregion}"
}





resource "aws_security_group" "allow_all" {
  name        = "appserver"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "appserver"
  }
}



resource "aws_instance" "appserver" {
  ami = "${var.appserver_ami}"
  instance_type = "${var.appserver_instancetype}"
  key_name = "${var.appserver_keyName}"
  vpc_security_group_ids =["${aws_security_group.allow_all.id}"]

  connection {
      type = "ssh"
      user = "ubuntu"
      private_key = "${file("./oregon.pem")}"
  }

  provisioner "remote-exec" {
      inline = [
          "sudo apt-get update",
          "sudo apt-get install tomcat7 -y"
      ]
  }


}



