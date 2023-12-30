resource "aws_instance" "web" {
  ami                         = "ami-008fe2fc65df48dac"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = "dell_idrsa"
  security_groups             = ["openall"]

  tags = {
    Name = "Web"
  }


}

resource "null_resource" "forprovisioning" {
  triggers = {
    increment = var.flag
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = aws_instance.web.public_ip

  }

  provisioner "file" {
    source      = "springpetclinic.service"
    destination = "/tmp/springpetclinic.service"

  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install openjdk-17-jdk -y",
      "wget https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-3.1.0-SNAPSHOT.jar"
    ]

  }

  depends_on = [ aws_instance.web ]

}