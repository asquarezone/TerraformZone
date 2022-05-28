# db subnet group
resource "aws_db_subnet_group" "db_subnet_group" {
    name        =  local.db_subnet_groupname
    subnet_ids  =  data.aws_subnets.db_subnets.ids
    depends_on = [
      aws_subnet.subnets
    ]
}


resource "aws_db_instance" "database" {
    allocated_storage           = 20
    db_name                     = "qtlmsdb"
    db_subnet_group_name        = local.db_subnet_groupname
    engine                      = "mysql"
    engine_version              = "8.0.28"
    instance_class              = "db.t3.micro"
    username                    = "admin"
    password                    = "admin123"
    skip_final_snapshot         = true
    identifier                  = "qtmyfirstrdsfromtf"

    depends_on = [
      aws_db_subnet_group.db_subnet_group
    ]
  
}
