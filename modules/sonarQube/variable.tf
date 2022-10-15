variable "sonarQube_ami" {
  default     = "ami-0b0af3577fe5e3532"
  description = "sonarQube AMI ID"
}
variable "instance_type" {
  default     = "t2.medium"
}
variable "az_B"{
    default = "us-west-2b"
}
variable "subnet_id" {
  default     = "subnet-76a8163a"
  description = "Subnet ID"
}
 variable "securitygroup_id" {
   default="sg-036254702898cb50c"
 }
variable "ass_pub_ip_address" {
   type = bool
   default = true
 }
variable "snarQube_Name" {
  default = "sonarQube-Server"
}
variable "keyname" {
    default = "kubenetes-key"  
}