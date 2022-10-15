### Creating Application Load Balancer for Docker lb
resource "aws_lb" "JenContainer-lb" {
  name               = var.lb_Name
  internal           = false
  load_balancer_type = var.lb_type
  security_groups    = [var.securitygroup_id]
  subnets            = [var.subnet_id1, var.subnet_id2]
  enable_deletion_protection = false
}
# Creating the target group - Docker lb
resource "aws_lb_target_group" "Jencontainer-tg" {
  name        = var.TG_name
  port        = var.port
  protocol    = var.tcp
  vpc_id      = var.vpc_id
  target_type = var.TG_type
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
  }
}
# Create Docker listener
resource "aws_lb_listener" "JenContainer_lb_lisner" {
  load_balancer_arn = aws_lb.JenContainer-lb.arn
  port              = var.lb_listener-port
  protocol          = var.tcp

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.Jencontainer-tg.arn
  }
}

# Create Docker Load balance target group attachement
resource "aws_lb_target_group_attachment" "PEP_attachmenet_TG" {
  target_group_arn = aws_lb_target_group.Jencontainer-tg.arn
  target_id        = var.target_id
  port             = var.port
}
