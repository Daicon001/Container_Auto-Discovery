variable "Ansible_ami" {
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
    default = "kubenetes-key"  
}
variable "ass_pub_ip_address" {
  type        = bool
  default     = true
}
variable "Ansible_Node_Name" {
  default     = "Ansible_Node"
  description = "Name Tag for Ansible Node"
}
variable "Dummy_pubIP" {
  description = "Dummy IP"
  default = "54.185.12.87"
}
variable "NewRelicLicence" {
  description = "New Relic Licence"
  type = string
  default = "use_correct_newrelic_licence_key"
}
