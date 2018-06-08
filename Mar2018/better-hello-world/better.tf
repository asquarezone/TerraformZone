variable "access" {}
variable "secret" {}
variable "region" {
    default = "us-west-2"
}
variable "instancetype" {
    default = "t2.micro"
}

variable "imageid" {
    default = "ami-09b390612e0d18528"
}

variable "keyname"{
    default = "Packer"
}

variable "secgroups" {
    type = "list"
    default = ["AllTCP"]
}

variable "private_key_path" {
    default = "Packer.pem"
}

# Configure the AWS Provider
provider "aws" {
  access_key = "${var.access}"
  secret_key = "${var.secret}"
  region     = "${var.region}"
}

resource "aws_instance" "web" {
  ami           = "${var.imageid}"
  instance_type = "${var.instancetype}"
  key_name      = "${var.keyname}"
  security_groups =  "${var.secgroups}"
  tags {
    Name = "HelloWorld"
  }

  connection {
    user        = "ubuntu"
    private_key = "${file(var.private_key_path)}"
  }
  
  provisioner "remote-exec" {
      inline = ["sudo apt-get update", "sudo apt-get install tree -y"]
  }

}