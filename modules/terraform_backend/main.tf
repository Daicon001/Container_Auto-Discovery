terraform {
  backend "s3" {
    bucket = var.s3_bucket_name
    key    = var.key
    region = var.region
    dynamodb_table = var.dynamodb_table_name
    encrypt = true
  }
}