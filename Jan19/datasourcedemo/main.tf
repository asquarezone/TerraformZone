provider "aws" {
  access_key = "${var.myaccesskey}"
  secret_key = "${var.mysecretkey}"
  region = "${var.myregion}"
}


data "aws_vpc" "myvpc" {
  cidr_block = "192.168.0.0/16"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  name_regex = "Ubuntu Server 16.04 LTS*"
}


resource "aws_security_group" "allow_all_me" {
  name        = "allow_all"
  description = "Allow all inbound traffic"
  vpc_id = "${data.aws_vpc.myvpc.id}"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all"
  }
}

resource "aws_instance" "learning" {
    ami = "${data.aws_ami.ubuntu.id}"
    vpc_security_group_ids = ["${aws_security_group.allow_all_me.id}"]
    
  
}
