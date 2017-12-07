provider "aws" {
  region     = "us-west-2"
  access_key = ""
  secret_key = ""
}
resource "aws_instance" "nginx" {
  ami = "ami-bf4193c7"
  instance_type = "t2.micro"
  key_name = "testingbc"
  security_groups = ["OnlySSH", "webserver"]

  connection {
    user = "ec2-user"
    private_key = "${file("testingbc.pem")}"
  }

  provisioner "file" {
    source = "index.html"
    destination = "/home/ec2-user/index.html"
  }

  provisioner "remote-exec" {
    inline = [ 
      "sudo yum update -y", 
      "sudo yum install nginx -y", 
      "sudo cp /home/ec2-user/index.html /usr/share/nginx/html/index.html",
      "sudo service nginx start"]
  }

}

output "aws_instance_public_dns" {
  value = "${aws_instance.nginx.public_dns}"
}