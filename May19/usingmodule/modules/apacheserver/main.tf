provider "aws" {
    region = "us-east-1"
    access_key = "${var.accesskey}"
    secret_key = "${var.secretkey}"
}

resource "aws_instance" "apache" {
   ami = "ami-0c6b1d09930fac512"
   key_name = "vpclearn"
   instance_type = "t2.micro"
   security_groups = ["Open all"]

   connection {
       type = "ssh"
       user = "ec2-user"
       private_key = "${file("./vpclearn.pem")}"
   }

   provisioner "remote-exec"{
       inline = ["sudo yum install httpd -y", "sudo service httpd start"]
   }
}

output "apacheip" {
  value = "${aws_instance.apache.public_ip}"
}


