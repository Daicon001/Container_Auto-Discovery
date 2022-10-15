variable "Jenkins_ami" {
  default     = "ami-0b0af3577fe5e3532"
  description = "Jenkin AMI ID"
}
variable "instance_type" {
  default     = "t2.medium"
  description = "Jenkins Server EC2 type"
}
variable "az_A"{
    default = "us-west-2a"
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
variable "Jenkins_Server_Name" {
  default = "Jenkins-Server"
}
variable "keyname" {
    default = "kubenetes-key"  
}
variable "NewRelicLicence" {
  description = "New Relic Licence"
  type = string
  default = "use_correct_newrelic_licence_key"
}