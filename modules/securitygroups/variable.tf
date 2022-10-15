# Security_Group variables 
variable "security-group_Name" {
    default = "DocJenSona_sg"
}
variable "vpc_id" {
default = "vpc-0e956f11ebd3cd342"
}
variable "vpc_cidr" {
    default     = "10.0.0.0/16"
}
variable "http_port" {
    default = 80
}
variable "ssh_port" {
    default = 22
}
variable "sona_port" {
    default = 9000  
}
variable "custom_http" {
    default = 8080
}
variable "all_cidr" {
    default     = "0.0.0.0/0"
}
