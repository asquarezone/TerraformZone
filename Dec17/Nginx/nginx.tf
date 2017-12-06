variable "aws_access_key" {
    default = ""
}
variable "aws_secret_key" {
    default = ""
}
variable "private_key_path" {
    default = "blockchain.pem"
}
variable "key_name" {
  default = "test"
}

variable "region" {
    default = "us-west-2"
}

provider "aws" {
  region     = "${var.region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

resource "aws_instance" "nginx" {
    ami = "ami-9fa343e7"
    instance_type = "t2.micro"
    key_name = "blockchain"
    security_groups = ["OnlySSH","webserver"]

    connection {
        user        = "ec2-user"
        private_key = "${file(private_key_path)}"
    }

    provisioner "file" {
        source = "blockchain.pem"
        destination ="/home/ec2-user/blockchain.pem"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo yum install nginx -y", 
            "sudo service nginx start"]
    }


}

output "aws_instance_public_dns" {
    value = "http://${aws_instance.nginx.public_ip}"
}