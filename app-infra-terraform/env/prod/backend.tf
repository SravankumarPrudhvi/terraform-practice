terraform {
  backend "s3" {
    bucket = "practice-terraform-state-07012026"
    key = "prod/app/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-state-lock"
    encrypt = true
    
  }
}