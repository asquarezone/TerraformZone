output "ipaddress" {
  value = "${aws_instance.appserver.public_ip}"
}
