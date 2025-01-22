output "url" {
    value = "http://${aws_lb.boxer.dns_name}/boxer"
  
}