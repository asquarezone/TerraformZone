# create a db subnet group

data "aws_subnets" "db" {
  filter {
    name   = "tag:Name"
    values = var.db_subnet_names
  }
  depends_on = [
    aws_subnet.subnets
  ]

}

resource "aws_db_subnet_group" "ntier" {
  name       = "ntier"
  subnet_ids = data.aws_subnets.db.ids
  tags = {
    Name = "ntier"
  }

  depends_on = [
    aws_subnet.subnets,
    data.aws_subnets.db

  ]

}

resource "aws_db_instance" "ntier" {
  allocated_storage      = 20
  db_name                = "emp"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = "root"
  password               = "rootroot"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.ntier.name
  identifier             = "qtntierdbfromtf"
  vpc_security_group_ids = [aws_security_group.dbsg.id]

  depends_on = [
    aws_db_subnet_group.ntier,
    aws_vpc.ntier_vpc,
    aws_subnet.subnets
  ]
}