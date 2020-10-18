locals {
  dbsubnets = ["db", "db2"]
  public_subnets        = lookup(var.associations, "public")
  private_subnets       = lookup(var.associations, "private")
  port_mysql            = 3306
  port_tomcat           = 8080
  port_ssh              = 22
  protocol              = "tcp"
  anywhere_cidr         = "0.0.0.0/0"
  start_port            = 0
  end_port              = 65535
  db_subnet_name        = "ntier"
  db_allocated_storage  = 20
  engine                = "mysql"
  username              = "qtdevops"
  password              = "rootroot"
  appserver             = "app server"
  #key-pair-path         = format("./%s.pem",var.key_name)
  prim_app_subnet_index = 1
  sec_app_subnet_index  = 5
}
