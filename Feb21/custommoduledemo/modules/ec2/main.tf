resource "aws_instance" "appserver1" {
    ami = data.aws_ami.ubuntu.id
    associate_public_ip_address = false
    instance_type = var.webserverinstancetype
    key_name = "terraform"
    vpc_security_group_ids = [ var.appsgid ]
    subnet_id = var.app1subnetid
    tags = {
      "Name" = "appserver 1"
    }
  
}

resource "aws_instance" "webserver1" {
    ami = data.aws_ami.ubuntu.id
    associate_public_ip_address = true
    instance_type = var.webserverinstancetype
    key_name = "terraform"
    vpc_security_group_ids = [ var.websgid ]
    subnet_id = var.web1subnetid
    tags = {
      "Name" = "webserver 1"
    }
  
}

resource "null_resource" "nullprovisoning" {

    # ssh -i terraform.pem ubuntu@publicip
    connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file("./terraform.pem")
      host = aws_instance.webserver1.public_ip
    }
    provisioner "remote-exec" {
      inline = [
        "sudo apt update", 
        "sudo apt install apache2 -y", 
        "sudo apt install php libapache2-mod-php php-mysql php-cli -y",
        "echo '<?php phpinfo(); ?>'| sudo tee /var/www/html/info.php"]
    }

    depends_on = [ aws_instance.webserver1 ]
  
}