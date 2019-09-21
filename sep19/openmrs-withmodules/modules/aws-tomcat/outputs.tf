output "webserver1-ip" {
  value = "${aws_instance.web1.public_ip}"
}

output "webserver2-ip" {
  value = "${aws_instance.web2.public_ip}"
}

