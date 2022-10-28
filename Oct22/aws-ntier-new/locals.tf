locals {
  az_a          = format("%sa",var.region)
  az_b          = format("%sb",var.region)
  mysql_port    = 3306
  http_port     = 80
  ssh_port      = 22
  tcp           = "tcp"
  anywhere      = "0.0.0.0/0"
  db_subnet_1   = 0
  db_subnet_2   = 1
  app_subnet_1  = 2
  app_subnet_2  = 3
}