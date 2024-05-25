output "url" {
    value = "http://${aws_lb.preschool.dns_name}/preschool"
}