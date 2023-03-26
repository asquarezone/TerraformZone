resource "aws_security_group" "db" {
  name = "mysql"
  ingress {
    from_port   = local.mysql_port
    to_port     = local.mysql_port
    cidr_blocks = [var.ntier_vpc_info.vpc_cidr]
    protocol    = local.tcp

  }
  tags = {
    Name = "mysql"
  }
  vpc_id = local.vpc_id

  depends_on = [
    aws_subnet.subnets
  ]
}

data "aws_subnets" "db" {
  filter {
    name   = "tag:Name"
    values = var.ntier_vpc_info.db_subnets
  }
  filter {
    name   = "vpc-id"
    values = [local.vpc_id]
  }
  depends_on = [
    aws_subnet.subnets
  ]

}

resource "aws_db_subnet_group" "ntier" {
  name       = "ntier"
  subnet_ids = data.aws_subnets.db.ids
  depends_on = [
    aws_subnet.subnets
  ]
}


resource "aws_db_instance" "empdb" {
  allocated_storage      = 20
  db_name                = "qtemployees"
  db_subnet_group_name   = "ntier"
  engine                 = "mysql"
  engine_version         = "8.0.28"
  instance_class         = "db.t2.micro"
  password               = "rootroot"
  username               = "admin"
  publicly_accessible    = false
  vpc_security_group_ids = [aws_security_group.db.id]
  skip_final_snapshot    = true

  depends_on = [
    aws_db_subnet_group.ntier,
    aws_security_group.db
  ]

}