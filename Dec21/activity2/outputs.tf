output "web1_publicip" {
    value = aws_instance.web_instance_1[0].public_ip
}

output "db_endpoint" {
    value = terraform.workspace == "UAT"?aws_db_instance.db[0].endpoint:""
}
output "vpc_id" {
    value = aws_vpc.primary_vpc.id
}
output "web1_subnet_id" {
    value = aws_subnet.subnets[0].id
}
output "web2_subnet_id" {
    value = aws_subnet.subnets[1].id
}
output "db1_subnet_id" {
    value = aws_subnet.subnets[2].id
}
output "db2_subnet_id" {
    value = aws_subnet.subnets[3].id
}
output "web_security_group_id" {
    value = aws_security_group.websg.id
}
output "db_security_group_id" {
    value = aws_security_group.dbsg.id
}
output "web_url" {
    value = format("http://%s", aws_instance.web_instance_1[0].public_ip )
}
output "ssh_command" {
    value = format("ssh -i %s.pem ubuntu@%s","fortf", aws_instance.web_instance_1[0].public_ip)
}