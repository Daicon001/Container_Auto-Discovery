variable "s3_bucket_name" {
    description = "S3 bucket name"
    default = "terraformstatedaicon" 
}
variable "prevent" {
    description = "Set to true in order not to accidentally destroy the s3 bucket"
    type = bool
    default = true
}
variable "versioning" {
    description = "Enable versioning on s3 bucket"
    type = bool
    default = true
}
variable "dynamodb_table_name" {
    description = "Dynamodb table name"
    default = "terraform-state_locking"
}
variable "billing_mode" {
    description = "Set the type of billing you want on the usage of dynamodb"
    default = "PAY_PER_REQUEST"
}
variable "hash-key_attribute_name" {
    default = "LockID"
}
