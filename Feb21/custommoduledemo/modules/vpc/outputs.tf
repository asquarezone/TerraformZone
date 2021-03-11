output "vpcid" {
    value = aws_vpc.ntiervpc.id
}

output "web1subnetid" {
    value = aws_subnet.subnets[0].id
}


output "web2subnetid" {
    value = aws_subnet.subnets[1].id
}

output "app1subnetid" {
    value = aws_subnet.subnets[2].id
}


output "app2subnetid" {
    value = aws_subnet.subnets[3].id
}

output "db1subnetid" {
    value = aws_subnet.subnets[4].id
}


output "db2subnetid" {
    value = aws_subnet.subnets[5].id
}

output "websgid" {
    value = aws_security_group.websg.id
}

output "appsgid" {
    value = aws_security_group.appsg.id
}

output "dbsgid" {
    value = aws_security_group.dbsg.id
}