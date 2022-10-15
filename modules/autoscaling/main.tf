# Creating autoscaling_groug
resource "aws_autoscaling_group" "Instance-ASG" {
  name                      = var.Instance-ASG-Name
  max_size                  = var.ASG_max_size
  min_size                  = var.ASG_min_size
  desired_capacity          = var.ASG_desired_capacity
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  force_delete              = true
  launch_configuration      = var.instance-asg-lc-name
  vpc_zone_identifier       = [var.vpc_identifier1, var.vpc_identifier2]
  target_group_arns         = [var.lb_target_group_arn]
  tag {
    key                 = var.tag_key_name
    value               = var.tag_value_name
    propagate_at_launch = true
  }
}

# Creating autoscaling policy
resource "aws_autoscaling_policy" "JenContainer-asg-policy" {
    name                   = var.JenContainer-policy-Name
    adjustment_type        = var.AD_type
    policy_type            = var.Plcy_type
    autoscaling_group_name = aws_autoscaling_group.Instance-ASG.name
    target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = var.TG_value
  }
}

