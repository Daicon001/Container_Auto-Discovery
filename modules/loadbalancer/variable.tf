variable "lb_Name" {
    default = "JenContainer-lb"
}
variable "lb_type" {
    default = "application"
}
variable "securitygroup_id" {
   type = string
   default="sg-036254702898cb50c"
}
variable "subnet_id1" {
  default     = "subnet-76a8163a"
  description = "Subnet ID"
}
variable "subnet_id2" {
  default     = "subnet2-76a8163a"
  description = "Subnet ID2"
}
variable "TG_name" {
    default = "Jencontainer-tg"
}
variable "port" {
    default = 8080
}
variable "tcp" {
    default = "HTTP"
}
variable "vpc_id" {
    default = "vpc-0e956f11ebd3cd342"
}
variable "TG_type" {
    default = "instance"
}
variable "lb_listener-port" {
    default = 80
}
variable "target_id" {
    description = "Docker ID"
    default = "0fc478dcb9081c456"
}