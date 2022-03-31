terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
  required_version = ">= 0.14.9"
}

# //////////////////////////////
# PROVIDERS
# //////////////////////////////
provider "aws" {
  profile = "default"
  #region = "ap-south-1"
  region = var.aws_region
  #secret_key = var.aws_secret_key
}