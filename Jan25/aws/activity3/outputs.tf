output "web-url" {
  value = format("http://%s", aws_instance.web.public_ip)
}

output "ssh_command" {
  value = format(
    "ssh -i %s %s@%s",
    var.key_file_info.private_key_path,
    var.web_server_info.username,
  aws_instance.web.public_ip)
}

