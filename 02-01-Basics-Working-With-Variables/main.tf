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

variable "iam_user_name_prefix" {
  type    = string #any, number, bool, list, map, set, object, tuple
  default = "my_iam_user"
}

# //////////////////////////////
# Terraform Configuration
# //////////////////////////////

# //////////////////////////////
# PROVIDERS
# //////////////////////////////
provider "aws" {
  region  = "us-east-1"
  //version = "~> 2.46" (No longer necessary)
}

# //////////////////////////////
# RESOURCES
# //////////////////////////////
# IAM User
resource "aws_iam_user" "my_iam_users" {
  count = 1
  name  = "${var.iam_user_name_prefix}_${count.index}"
}

# //////////////////////////////
# OUTPUT
# //////////////////////////////
