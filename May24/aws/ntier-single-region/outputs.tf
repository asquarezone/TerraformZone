output "web-ip" {
  value = aws_instance.web.public_ip
}

output "web-url" {
  value = "http://${aws_instance.web.public_ip}/preschool"

}

output "web-url-other" {
  value = format("http://%s/preschool", aws_instance.web.public_ip)

}