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