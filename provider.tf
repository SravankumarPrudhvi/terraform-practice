terraform {
  required_providers {
    aws ={
        source = "hashicorp/aws"
        version = "~>5.0"
        region = "ap-south-1"
    }
    required_version = ">=1.3"
  }
}
