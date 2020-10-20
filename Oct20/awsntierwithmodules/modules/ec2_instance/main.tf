# Security group for appserver
resource "aws_security_group" "app-sg" {
    name            = "allow_app"
    description     = "security group for appserver"
    vpc_id          = var.vpc_id

    ingress {
        from_port   = local.port_tomcat
        to_port     = local.port_tomcat
        cidr_blocks = [ local.anywhere_cidr ]
        protocol    = local.protocol
    }

    ingress {
        from_port   = local.port_ssh
        to_port     = local.port_ssh
        cidr_blocks = [ local.anywhere_cidr ]
        protocol    = local.protocol
    }

    egress {
        from_port   = local.start_port
        to_port     = local.end_port
        cidr_blocks = [ local.anywhere_cidr ]
        protocol    = local.protocol
    }
    
}

## appserver

resource "aws_instance" "server" {
    # needs to be changed
    ami                         = var.ubuntu_18_ami
    instance_type               = var.instance_type
    key_name                    = var.key_name
    vpc_security_group_ids      = [ aws_security_group.app-sg.id ]
    associate_public_ip_address = true
    subnet_id                   = var.subnet_id

    tags                        = {
        Name                    = var.tagname
    }

    connection {
        type                    = "ssh"
        user                    = "ubuntu"
        host                    = self.public_ip
        private_key             = file("./awsclassroom.pem")
    }

    provisioner "remote-exec" {
        inline                  = var.inline_scripts

    }

}