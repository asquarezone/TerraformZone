# fetch ubuntu ami
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# fetch key pair
data "aws_key_pair" "id_rsa" {
  key_name = var.key_name

}

data "aws_security_group" "openall" {
  name = var.security_group_name
}

data "aws_vpc" "default" {
  default = true

}


data "aws_subnet" "web" {
  vpc_id            = data.aws_vpc.default.id
  availability_zone = var.az

}

resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_size
  key_name                    = data.aws_key_pair.id_rsa.key_name
  vpc_security_group_ids      = [data.aws_security_group.openall.id]
  associate_public_ip_address = true
  subnet_id                   = data.aws_subnet.web.id
  tags = {
    Name = "preschool"
  }
  

  depends_on = [
    data.aws_ami.ubuntu,
    data.aws_key_pair.id_rsa,
    data.aws_security_group.openall,
    data.aws_subnet.web
  ]
}

resource "null_resource" "script" {
    triggers = {
        build_id = var.build_id
    }
    connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.key_path)
    host        = aws_instance.web.public_ip
  }

  provisioner "remote-exec" {
    script = "install.sh"
    # inline = [ 
    #     "sudo apt update",
    #     "sudo apt install nginx -y"
    #  ]

  }


    depends_on = [ aws_instance.web ]
  
}