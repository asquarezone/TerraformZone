resource "aws_instance" "myec2" {
    ami= "${var.ami}"
    instance_type = "${var.instancetype}"
    key_name = "${var.keyname}"
    vpc_security_group_ids = "${var.secgroupids}"

    connection {
        type = "ssh"
        user = "ubuntu"
        private_key = "${file("./oregon.pem")}"
    }

    provisioner "remote-exec" {
        inline = [
        "sudo apt-get update",
        "sudo apt-get install git tree nano -y",
        ]
    }
  
}

output "publicip" {
  value = "${aws_instance.myec2.public_ip}"
}




