# data source for ubuntu 22 

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

  owners = ["099720109477"] # Canonical
}

# launch template
resource "aws_launch_template" "preschool" {
  name          = "preschool"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = "my_idrsa"
  vpc_security_group_ids = [
    aws_security_group.web.id
  ]
  tags = {
    Name = "preschool"
  }
  user_data = filebase64("install.sh")


  depends_on = [
    module.vpc,
    data.aws_ami.ubuntu,
    aws_security_group.web
  ]
}

resource "aws_autoscaling_group" "preschool" {
  desired_capacity = 1
  max_size         = 1
  min_size         = 1
  launch_template {
    id      = aws_launch_template.preschool.id
    version = "$Latest"
  }
  vpc_zone_identifier = module.vpc.public_subnets
  target_group_arns   = [aws_lb_target_group.preschool.arn]

}