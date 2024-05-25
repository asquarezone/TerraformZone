locals {
  ssh          = 22
  http         = 80
  any_ipv4     = "0.0.0.0/0"
  any_ipv6     = "::/0"
  tcp          = "tcp"
  any_protocol = "-1"
  start_port   = 0
  end_port     = 65535
}