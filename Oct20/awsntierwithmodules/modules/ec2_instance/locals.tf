locals {
  port_mysql            = 3306
  port_tomcat           = 8080
  port_ssh              = 22
  port_http             = 80
  protocol              = "tcp"
  anywhere_cidr         = "0.0.0.0/0"
  start_port            = 0
  end_port              = 65535
  username              = "qtdevops"
  password              = "rootroot"
  appserver             = "app server"
  webserver             = "web server"
  #key-pair-path         = format("./%s.pem",var.key_name)
  prim_app_subnet_index = 1
  sec_app_subnet_index  = 5
}
