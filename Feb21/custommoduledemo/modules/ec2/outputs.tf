output "webserverid" {
    value = aws_instance.webserver1.id
  
}

output "webserverip" {
    value = aws_instance.webserver1.public_ip
}

output "url" {
    # http://webserverip/info.php
    value = format("http://%s/info.php",aws_instance.webserver1.public_ip)
  
}