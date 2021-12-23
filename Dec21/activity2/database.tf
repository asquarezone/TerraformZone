# Db subnet group
resource "aws_db_subnet_group" "ntier_db" {
    name        = "ntier"
    subnet_ids  = [aws_subnet.subnets[2].id, aws_subnet.subnets[3].id]
  
}

# db instance

resource "aws_db_instance" "db" {
    allocated_storage           = 20
    apply_immediately           = true
    auto_minor_version_upgrade  = false
    backup_retention_period     = 0
    db_subnet_group_name        = aws_db_subnet_group.ntier_db.name
    engine                      = "postgres"
    identifier                  = "qtrdsfortf" 
    instance_class              = "db.t3.micro"
    multi_az                    = false
    name                        = "instacook"
    username                    = "postgres"
    password                    = "postgres" 
    vpc_security_group_ids      = [aws_security_group.dbsg.id]
}