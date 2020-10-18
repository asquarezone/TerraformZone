# Security group for appserver
resource "aws_security_group" "app-sg" {
    name            = "allow_app"
    description     = "security group for appserver"
    vpc_id          = aws_vpc.ntier.id

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

    depends_on      = [
        aws_db_instance.primary_db
    ]
}

## appserver

resource "aws_instance" "app-server" {
    # needs to be changed
    ami                         = var.ubuntu_18_ami
    instance_type               = var.appserver_instance_type
    key_name                    = var.key_name
    vpc_security_group_ids      = [ aws_security_group.app-sg.id ]
    associate_public_ip_address = true
    subnet_id                   = aws_subnet.subnets[local.prim_app_subnet_index].id

    tags                        = {
        Name                    = local.appserver
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
            "sudo apt install tomcat8 tomcat8-admin tomcat8-common tomcat8-docs tomcat8-examples -y",
            "cd /var/lib/tomcat8/webapps",
            "sudo wget https://referenceappkhaja.s3-us-west-2.amazonaws.com/gameoflife.war"
        ]

    }

}