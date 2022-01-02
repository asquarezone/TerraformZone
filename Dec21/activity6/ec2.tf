# We need to get the vpc id

data "aws_vpc" "default_vpc" {
    default = true
}

# We need to get the subnet id
data "aws_subnet" "first" {
    vpc_id = data.aws_vpc.default_vpc.id
    cidr_block = "172.31.0.0/20"
}

# we need to get the security group id

data "aws_security_group" "open_all" {
    vpc_id = data.aws_vpc.default_vpc.id
    name = "openall"
}


resource "aws_instance" "web_instance_1" {
  ami                           = "ami-0892d3c7ee96c0bf7"
  associate_public_ip_address   = true
  instance_type                 = "t2.micro"
  key_name                      = "fortf" 
  vpc_security_group_ids        = [data.aws_security_group.open_all.id]
  subnet_id                     = data.aws_subnet.first.id

  tags = {
    Name = "Web"
  } 
}

resource "null_resource" "deployapp" {

    triggers = {
        build_id = var.build_id
    }

    connection {
      type          = "ssh"
      user          = "ubuntu"
      private_key   = file("./fortf.pem")
      host          = aws_instance.web_instance_1.public_ip
    }
    # install necesssary stuff to make ansible work on the newly cretaed node
    provisioner "remote-exec" {
        inline = [
          "sudo apt update",
          "sudo apt install python3 -y",
        ]
    }

    # This provisioner will execute ansible playbook on local machine which will call ansible
    # playbook to run on the newly create node

    provisioner "local-exec" {
        command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu -i '${aws_instance.web_instance_1.public_ip}' --private-key './fortf.pem' sample.yaml"
      
    }

    depends_on = [
      aws_instance.web_instance_1
    ]
  
}