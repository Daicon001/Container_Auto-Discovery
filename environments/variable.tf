variable "key" {
  description = "The path on s3-Bucket that state file will be stored"
  default = "global/s3/terraform.tfstate"
}
variable "region" {
  description = "Region where the whole project will be provisioned"
  default = "us-west-2"
  
}
variable "dev_instance_ami" {
  default = "ami-08970fb2e5767e3b8"
}
variable "dev_key_name" {
  default = "test-key"
}
variable "dev_path_to_public_key" {
  default     = "~/keypairs/test-key.pub"
  description = "path to public key"
}
variable "NewRelic_Licence" {
    description = "New relic linence number"
    type = string
    sensitive = true  
}
