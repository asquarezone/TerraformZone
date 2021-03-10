resource "aws_instance" "appserver1" {
    ami = data.aws_ami.ubuntu.id
    associate_public_ip_address = false
    instance_type = var.webserverinstancetype
    key_name = "terraform"
    vpc_security_group_ids = [ aws_security_group.appsg.id ]
    subnet_id = aws_subnet.subnets[2].id
    tags = {
      "Name" = "appserver 1"
    }
    depends_on = [ aws_db_instance.ntierdb ]
  
}

resource "aws_instance" "webserver1" {
    ami = data.aws_ami.ubuntu.id
    associate_public_ip_address = true
    instance_type = var.webserverinstancetype
    key_name = "terraform"
    vpc_security_group_ids = [ aws_security_group.websg.id ]
    subnet_id = aws_subnet.subnets[0].id
    tags = {
      "Name" = "webserver 1"
    }
    

    depends_on = [ aws_db_instance.ntierdb ]
  
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