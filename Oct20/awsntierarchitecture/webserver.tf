# Security group for webserver
resource "aws_security_group" "web-sg" {
    name            = "allow_web"
    description     = "security group for webserver"
    vpc_id          = aws_vpc.ntier.id

    ingress {
        from_port   = local.port_http
        to_port     = local.port_http
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

    depends_on      = [
        aws_db_instance.primary_db
    ]
}

## webserver

resource "aws_instance" "web-server" {
    # needs to be changed
    ami                         = var.ubuntu_18_ami
    instance_type               = var.webserver_instance_type
    key_name                    = var.key_name
    vpc_security_group_ids      = [ aws_security_group.web-sg.id ]
    associate_public_ip_address = true
    subnet_id                   = aws_subnet.subnets[local.prim_web_subnet_index].id

    tags                        = {
        Name                    = local.webserver
    }

    connection {
        type                    = "ssh"
        user                    = "ubuntu"
        host                    = self.public_ip
        private_key             = file("./awsclassroom.pem")
    }

    provisioner "remote-exec" {
        inline                  = [
            "sudo apt update",
            "sudo apt install nginx -y"
        ]

    }

}