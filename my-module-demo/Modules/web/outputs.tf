output "hostname" {
    value = "${aws_instance.httpd.public_dns}"
}

output "ipaddress" {
    value = "${aws_instance.httpd.public_ip}"
}
output "instanceid" {
    value = "${aws_instance.httpd.id}"
}