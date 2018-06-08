output "ip" {
  value = "${aws_instance.web.public_ip}"
}

output "hostname" {
    value = "${aws_instance.web.public_dns}"
}