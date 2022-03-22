# //////////////////////////////
# VARIABLES
# //////////////////////////////
# //////////////////////////////
# Terraform Configuration
# //////////////////////////////

# //////////////////////////////
# PROVIDERS
# //////////////////////////////
terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 1.0.4"
        }
    }
}
provider "aws" {
  access_key = ""
  secret_key = ""
  region     = ""
}

# //////////////////////////////
# RESOURCES
# //////////////////////////////

# S3 Bucket 
resource "aws_s3_bucket" "my_s3_bucket" {
    bucket = "my-s3-bucket-maradi-01"
    versioning {
        enabled = true
    }
}

#IAM User

resource "aws_iam_user" "my_iam_user" {
    name = "Terraform-Practice"
}

# //////////////////////////////
# OUTPUT
# //////////////////////////////
