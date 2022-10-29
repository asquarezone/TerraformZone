resource "aws_instance" "webec2" {
    ami = var.ami-id
    associate_public_ip_address = true
    instance_type = "t2.micro"
    key_name = "my_key_pair"
    vpc_security_group_ids = [ aws_security_group.web_sg.id]
    subnet_id = module.vpc.public_subnets[0]
    tags = {
      "Name" = "web"
    }

    depends_on = [
      module.vpc,
      aws_security_group.web_sg
    ]



    provisioner "remote-exec" {

      connection {
        type = "ssh"
        user = "ubuntu"
        private_key = file("~/.ssh/id_rsa")
        host = aws_instance.webec2.public_ip 
      }

      inline = [
        "sudo apt update",
        "sudo apt install nginx -y",
        "sudo apt install tree -y"
      ]
      
    }
  
}