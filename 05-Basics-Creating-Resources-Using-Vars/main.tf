# //////////////////////////////
# VARIABLES
# //////////////////////////////
variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "ssh_key_name" {}

variable "private_key_path" {}

variable "region" {
  default = "us-east-2"
}


# //////////////////////////////
# Terraform Configuration
# //////////////////////////////

# //////////////////////////////
# PROVIDERS
# //////////////////////////////
provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.region
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
