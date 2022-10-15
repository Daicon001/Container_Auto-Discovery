variable "Bastion_ami" {
    default = "ami-06640050dc3f556bb"
}
variable "instance_type" {
    default = "t2.medium"
}
variable "az_A"{
    default = "us-west-2a"
}
variable "securitygroup_id" {
   default="sg-036254702898cb50c"
}
variable "subnet_id" {
  default     = "subnet-76a8163a"
  description = "Subnet ID"
}
variable "keyname" {
    default = "test-key"  
}
variable "ass_pub_ip_address" {
  type        = bool
  default     = true
}
variable "Bastion_Host_Name" {
  default     = "Bastion_Node"
  description = "Name Tag for Ansible Node"
}

