resource "aws_db_subnet_group" "ntier-db-group" {
    name            = "ntier"
    subnet_ids      = data.aws_subnet_ids.dbsubnets.ids
    tags            = {
        Name        =  "ntier-db-subnet-group"
    }

    depends_on  = [
        aws_subnet.subnets,
        aws_route_table_association.public-associations,
        aws_route_table_association.private-associations,
    ]
}


resource "aws_security_group" "rds-sg" {
    name            = "allow_mysql"
    description     = "security group for database"
    vpc_id          = aws_vpc.ntier.id

    ingress {
        from_port   = local.port_mysql
        to_port     = local.port_mysql
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
        aws_db_subnet_group.ntier-db-group
    ]
}