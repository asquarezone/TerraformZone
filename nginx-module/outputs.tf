
output "aws_instance_public_dns" {
    value = "${aws_instance.nginx.public_dns}"
}
