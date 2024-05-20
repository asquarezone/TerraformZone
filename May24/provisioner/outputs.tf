output "ssh_comand" {
  value = "ssh -i ${var.key_name}.pem ubuntu@${aws_instance.web.public_ip}"
}

output "url" {
  value = "http://${aws_instance.web.public_ip}/preschool"

}