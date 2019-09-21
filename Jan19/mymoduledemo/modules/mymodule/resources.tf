resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all inbound traffic"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_all"
  }
}


resource "aws_ebs_volume" "myvolume" {
  availability_zone = "${var.myaz}"
  size = "1"
  tags = {
    Name = "Terraform"
  }
}



resource "aws_eip" "myeip" {

  tags = {
    Name = "Terraform"
  }  
}