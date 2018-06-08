provider "aws" {
  region     = "${var.region}"
  access_key = "${var.accesskey}"
  secret_key = "${var.secretkey}"
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = "${var.vpcid}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "appserver1" {
  ami             = "${var.imageid}"
  instance_type   = "${var.instancetype}"
  key_name        = "${var.key}"
  security_groups = ["${aws_security_group.allow_all.name}"]

  connection {
    user        = "ubuntu"
    private_key = "${file(var.privatekeypath)}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install tomcat7 -y",
    ]
  }
}

resource "aws_instance" "appserver2" {
  ami             = "${var.imageid}"
  instance_type   = "${var.instancetype}"
  key_name        = "${var.key}"
  security_groups = ["${aws_security_group.allow_all.name}"]

  connection {
    user        = "ubuntu"
    private_key = "${file(var.privatekeypath)}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install tomcat7 -y",
    ]
  }
}

resource "aws_db_instance" "dbserver" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
}
