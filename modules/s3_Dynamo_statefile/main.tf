# Provision s3 bucket for state file
resource "aws_s3_bucket" "terraform_state" {
  bucket = var.s3_bucket_name

  lifecycle {
    prevent_destroy = false
  }
  versioning {
    enabled = var.versioning
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default{
        sse_algorithm = "AES256"
      }
    }
  }  
}

# Provision Dynamobd table for state locking
resource "aws_dynamodb_table" "terraform_locks" {
  name = var.dynamodb_table_name
  billing_mode = var.billing_mode
  hash_key = var.hash-key_attribute_name

  attribute {
    name = var.hash-key_attribute_name
    type = "S"
  } 
}
