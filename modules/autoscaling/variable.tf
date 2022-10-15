variable "Instance-ASG-Name" {
    default = "Docker-ASG"
}
variable "ASG_min_size" {
    default = 2
}
variable "ASG_max_size" {
    default = 3
}
variable "ASG_desired_capacity" {
    default = 2
}
variable "health_check_grace_period" {
    default = 300 
}
variable "health_check_type" {
    default = "EC2"
}
variable "instance-asg-lc-name" {
    default = "docker-asg"
}
variable "vpc_identifier1" {
    default     = "subnet-76a8123a"
    description = "Subnet ID" 
}
variable "vpc_identifier2" {
    default     = "subnet-7436a8123a"
    description = "Subnet ID" 
}
variable "lb_target_group_arn" {
    default = "arn:aws:elasticloadbalancing:us-west-2:842051480147:loadbalancer/Jencontainer-tg"
    description = "load balancer target group arn"
}
variable "tag_key_name" {
    default = "Name"
    description = "tag key value is NAME"
}
variable "tag_value_name" {
    default = "docker-asg"
    description = "tag value is docker-asg"
}

variable "JenContainer-policy-Name" {
    default = "JenContainer-asg-policy"
}
variable "AD_type" {
    default = "ChangeInCapacity"
}
variable "Plcy_type" {
    default = "TargetTrackingScaling"
}
variable "TG_value" {
    default = 60.0
}
