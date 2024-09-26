# get default vpc id

data "aws_vpc" "default" {
  default = true
}

# create security group
resource "aws_security_group" "openhttp" {
  name        = "openhttp-tf"
  description = "openhttp"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "openhttp-tf"
  }

}

# get the ubuntu 22.04 ami
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

# ec2 instance
resource "aws_instance" "web" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.openhttp.name]
  key_name        = "my_idrsa"
  user_data       = file("browny.sh")

  tags = {
    Name = "web-tf"
  }

}
