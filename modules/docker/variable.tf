variable "docker_ami" {
    default = "ami-06640050dc3f556bb"
}
variable "instance_type" {
    default = "t2.medium"
}
variable "az_A"{
    default = "us-west-2a"
}
variable "security_group_id" {
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
  description = "public ip address attachment to the instance"
}
variable "Docker_Server_Name" {
  default     = "JenCont-Docker-Server"
  description = "Name Tag for Docker Server"
}
variable "NewRelicLicence" {
  description = "New Relic Licence"
  type = string
  default = "use_correct_newrelic_licence_key"
}