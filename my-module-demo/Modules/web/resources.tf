provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "httpd" {
  ami           = "${var.imageid}"
  instance_type = "t2.micro"
  key_name        = "${var.key_name}"
  security_groups = "${var.security_groups}"

  connection {
    user        = "ec2-user"
    private_key = "${file(var.private_key_path)}"
  }

  provisioner "file" {
    source      = "${var.homepagepath}"
    destination = "/tmp/index.html"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo cp /tmp/index.html /var/www/html/index.html",
      "sudo service httpd start"
    ]
  }
}