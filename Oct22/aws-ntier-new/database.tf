# dbsubnet group

resource "aws_db_subnet_group" "mysqldbsubnetgroup" {
    name = "mysqldbsubnetgroup"
    subnet_ids = [ module.vpc.private_subnets[local.db_subnet_1], module.vpc.private_subnets[local.db_subnet_2] ]
    depends_on = [
      module.vpc
    ]
}


resource "aws_db_instance" "default" {
  allocated_storage    = 20
  db_name              = "qtrdsfromtf"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "root"
  password             = "rootroot"
  skip_final_snapshot  = true
  depends_on = [
    module.vpc,
    aws_db_subnet_group.mysqldbsubnetgroup
  ]
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name = aws_db_subnet_group.mysqldbsubnetgroup.name
}