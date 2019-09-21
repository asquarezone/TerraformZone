
output "elasticipaddress" {
  value = "${aws_eip.myeip.public_ip}"
}

output "volumeid" {
  value = "${aws_ebs_volume.myvolume.id}"
}

output "securitygroupid" {
  value = "${aws_security_group.allow_all.id}"
}



