
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
      inline = ["sudo apt-get update", "sudo apt-get install apache2 -y"]
  }

}

