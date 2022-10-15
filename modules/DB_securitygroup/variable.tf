variable "security-group_Name" {
    default = "Database_sg"
}
variable "vpc_id" {
default = "vpc-0e956f11ebd3cd342"
}
variable "mysql" {
    default = 3306
}
variable "all_cidr" {
    default     = "0.0.0.0/0"
}
variable "vpc_cidr" {
    default     = "10.0.0.0/16"
}