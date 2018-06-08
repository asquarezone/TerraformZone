output "PublicIp" {
  value = "${aws_instance.one.public_ip}"
}

output "privateip" {
  value = "${aws_instance.one.private_ip}"
}
