resource "aws_lb" "preschool" {
  load_balancer_type = "network"
  name               = "preschool"
  internal           = false
  subnets            = module.vpc.public_subnets
  security_groups    = [aws_security_group.web.id]

}

resource "aws_lb_listener" "tcp" {
  load_balancer_arn = aws_lb.preschool.arn
  port              = local.http
  protocol          = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.preschool.arn
  }

}


resource "aws_lb_target_group" "preschool" {
  name     = "preschool-tg"
  port     = 80
  protocol = "TCP"
  vpc_id   = module.vpc.vpc_id
}
