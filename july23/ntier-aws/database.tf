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

# resource "aws_db_instance" "ntierdb" {


# }