##################################################################################
# VARIABLES
##################################################################################

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "private_key_path" {}
variable "key_name" {
  default = "test"
}

##################################################################################
# PROVIDERS
##################################################################################

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "us-east-1"
}

##################################################################################
# RESOURCES
##################################################################################
#security group for aws
resource "aws_security_group" "nginx_sg"{
  name          = "nginx_sg"
  description   = "security group for nginx from terraform"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "nginx" {
  ami           = "ami-c58c1dd3"
  instance_type = "t2.micro"
  key_name        = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.nginx_sg.id}"]

  connection {
    user        = "ec2-user"
    private_key = "${file(var.private_key_path)}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install nginx -y",
      "sudo service nginx start"
    ]
  }
}

resource "aws_instance" "nginx1" {
  ami           = "ami-c58c1dd3"
  instance_type = "t2.micro"
  key_name        = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.nginx_sg.id}"]

  connection {
    user        = "ec2-user"
    private_key = "${file(var.private_key_path)}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install nginx -y",
      "sudo service nginx start"
    ]
  }
}


data "aws_instance" "foo" {
  #instance_id = "i-00c0aee98f07abe22" 
  filter {
    name   = "image-id"
    values = ["ami-c58c1dd3"]
  }

}

##################################################################################
# OUTPUT
##################################################################################

output "aws_instance_public_dns" {
    value = "${aws_instance.nginx.public_dns}"
}

output "aws_instance_public_ip"{
    value = "${data.aws_instance.foo.public_ip}"
}
