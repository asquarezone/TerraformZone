locals {
  dbsubnets = ["db", "db2"]
  public_subnets    = lookup(var.associations, "public")
  private_subnets   = lookup(var.associations, "private")
  port_mysql        = 3306
  protocol          = "tcp"
  anywhere_cidr     = "0.0.0.0/0"
  start_port        = 0
  end_port          = 65535
}
