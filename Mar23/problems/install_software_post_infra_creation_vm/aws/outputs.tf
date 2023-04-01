output "apacheurl" {
  value = format("http://%s", aws_instance.apache.public_ip)
}