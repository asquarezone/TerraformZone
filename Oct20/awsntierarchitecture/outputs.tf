output web-server-url {
  value       = format("http://%s",aws_instance.web-server.public_ip)
  description = "url of the web server"
  depends_on  = [ aws_instance.web-server ]
}

output app-server-url {
  value       = format("http://%s:8080/gameoflife",aws_instance.app-server.public_ip)
  description = "url of the app server"
  depends_on  = [ aws_instance.app-server ]
}

output mysql-connection {
  value       = aws_db_instance.primary_db.address
  description = "mysql-hostname"
  depends_on  = [ aws_db_instance.primary_db ]
}

