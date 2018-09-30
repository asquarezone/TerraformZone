 variable "accesskey" {
     type = "string"
 }

 variable "secretkey" {
     type = "string"
 }

 variable "private_key_path" {
     type ="string"
     default = "./terraform.pem"
 }

provider "aws" {
    access_key = "${var.accesskey}"
    secret_key = "${var.secretkey}"
    region = "us-east-1"
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   egress {
      from_port = 0
      to_port = 65535
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  tags {
    Name = "allow_all"
  }
}

resource "aws_instance" "rhel1" {
    ami = "ami-6871a115"
    key_name = "terraform"
    instance_type = "t2.micro"
    vpc_security_group_ids = ["${aws_security_group.allow_all.id}"]

    connection {
        user = "ec2-user"
        private_key = "${file(var.private_key_path)}"
    }

    provisioner "remote-exec" {
        inline = ["sudo yum install httpd -y", "sudo service httpd start"]
    }
}

resource "aws_s3_bucket" "myvideos" {
    bucket = "qt.s3.videos.com"
  
}

output "publicip" {
  value = "${aws_instance.rhel1.public_ip}"
}



