resource "aws_s3_bucket" "terraform_state" {
  bucket = "practice-terraform-state-07012026"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform-lock" {
  name = "terraform-state-lock"
  billing_mode =  "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    purpose = "Terrafrom State Locking"
  }
}