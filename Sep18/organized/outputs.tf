
output "publicip" {
  value = "${aws_instance.rhel1.public_ip}"
}
