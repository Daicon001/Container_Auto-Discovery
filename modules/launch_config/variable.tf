variable "instance-as-lc-Name" {
  default = "docker-asg"
  description = "Name of the instance launch config"
}
variable "instance_type" {
  default     = "t2.medium"
}
variable "image_id" {
  default = "i-0f07799f389f89c63"
  description = "already provisioned instance ID"
}
variable "securitygroup_id" {
   default="sg-036254702898cb50c"
   description = "already provisioned security ID"
 }
 variable "keyname" {
    default = "test-key"  
}
variable "ass_pub_ip_address" {
   type = bool
   default = true
 }
