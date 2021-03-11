resource "aws_db_subnet_group" "dbsubnetgroup" {
    name = local.db_subnet_group_name
    subnet_ids = [ var.db1subnetid, var.db2subnetid ]
    tags = {
      "Name" = "ntier db subnet group"
    }
  
}

resource "aws_db_instance" "ntierdb" {
    allocated_storage = 20
    allow_major_version_upgrade = false
    auto_minor_version_upgrade = false
    backup_retention_period = 0
    db_subnet_group_name = local.db_subnet_group_name
    engine = "mysql"
    engine_version = "8.0.20"
    instance_class = "db.t2.micro"
    name = "ntierdb"
    vpc_security_group_ids = [ var.dbsgid ]
    username = "qtdevops"
    password = "admin1234"
    tags = {
      "Name" = "ntierdb"
    }
    skip_final_snapshot  = true

    depends_on = [ 
        aws_db_subnet_group.dbsubnetgroup
     ]
  
}