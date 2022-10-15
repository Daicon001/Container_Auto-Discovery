variable "s3_bucket_name" {
    description = "Use real bucket name"
    default   = "use_real_bucket_name"
}
variable "key" {
  description = "Correct path in the s3 bucket that state file will be stored"
  default = "use_real_path_in_the_s3-bucket"
}
variable "region" {
    description = "Specify the region where your project will be provisioned"
    default = "use_real_region"
}
variable "dynamodb_table_name" {
    description = "Use real dynamodb table name"
    default = "use_real_bucket_name"
}