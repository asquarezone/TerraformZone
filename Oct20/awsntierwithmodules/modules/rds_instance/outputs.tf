output mysql-connection {
  value       = aws_db_instance.primary_db.address
  description = "mysql-hostname"
  depends_on  = [ aws_db_instance.primary_db ]
}