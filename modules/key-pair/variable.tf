variable "key_name" {
    default = "test-key"  
}
variable "path_to_public_key" {
  default     = "~/keypairs/test-key.pub"
  description = "path to public key"
}