variable "vpc_name" {
  default = "JenCont"
}
variable "vpc_cidr" {
    default     = "10.0.0.0/16"
    description = "JenCont_VPC"
}
variable "PUB_SN1_cidr" {
    default     = "10.0.1.0/24"
    description = "JenCont-pub_sn1"
}
variable "az_A"{
    default = "us-west-2a"
}
variable "pub_sn1_tag" {
    default = "JenCont-pub_sn1"
}
variable "PUB_SN2_cidr" {
    default     = "10.0.2.0/24"
    description = "JenCont-pub_sn2"
}
variable "az_B"{
    default = "us-west-2b"
}
variable "pub_sn2_tag" {
    default = "JenCont-pub_sn2"
}
variable "PRV_SN1_cidr" {
    default     = "10.0.3.0/24"
    description = "JenCont-prv_sn1"
}
variable "prv_sn1_tag" {
    default = "JenCont-prv_sn1"
}
variable "PRV_SN2_cidr"{
    default     = "10.0.4.0/24"
    description = "JenCont-prv_sn2"
}
variable "prv_sn2_tag" {
    default = "JenCont-prv_sn2"
}
variable "igw_name" {
    default = "JenCont-igw"
}
variable "nat_gateway" {
    default = "JenCont_NAT_GW"
}
variable "route_pub_table" {
    default = "JenCont_PUB_SN_RT"
}

variable "route_prv_table" {
    default = "JenCont_PRV_SN_RT"
}
variable "all_cidr"{
    default = "0.0.0.0/0"
}
