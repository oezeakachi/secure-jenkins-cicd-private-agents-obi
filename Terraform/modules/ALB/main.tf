resource "aws_lb" "ALB" {
  name                       = "ALB"
  internal                   = false
  load_balancer_type         = "application"
  enable_deletion_protection = false
  ip_address_type            = "ipv4"
  security_groups            = [var.allow_egress_all_sg_id, var.allow_http_sg_id]
  subnets                    = var.subnet_id
}

resource "aws_lb_target_group" "ALB-TG" {
  name        = "ALB-TG"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.VPC_ID
  target_type = "instance"

  health_check {
    path                = "/"
    port                = 80
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-399"
  }
}

resource "aws_lb_listener" "frontend" {
  load_balancer_arn = aws_lb.ALB.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ALB-TG.arn
  }
}
resource "aws_alb_target_group_attachment" "TG-Reg" {
  target_group_arn = aws_lb_target_group.ALB-TG.arn
  target_id        = var.AppInstance
  port             = 80
}
