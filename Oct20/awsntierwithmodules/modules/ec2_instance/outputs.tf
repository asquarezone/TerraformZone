output server_public_ip {
  value       = aws_instance.server.public_ip
  description = "public ip of the server"
}
