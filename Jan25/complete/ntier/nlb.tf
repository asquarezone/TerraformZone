resource "aws_lb" "boxer" {
  name               = "boxer"
  internal           = false
  load_balancer_type = "network"
  subnets            = module.vpc.public_subnets

  enable_deletion_protection = false

  tags = {
    Environment = "dev"
  }
}


resource "aws_lb_target_group" "boxer" {
  name     = "boxer"
  port     = 80
  protocol = "TCP"
  vpc_id   = module.vpc.vpc_id
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    protocol            = "TCP"
  }
}


resource "aws_lb_target_group_attachment" "test" {
  count            = var.web_server_info.count
  target_group_arn = aws_lb_target_group.boxer.arn
  target_id        = aws_instance.web[count.index].id
  port             = 80
}

resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.boxer.arn
  port              = 80
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.boxer.arn
  }
}