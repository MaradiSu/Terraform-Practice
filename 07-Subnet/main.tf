# //////////////////////////////
# VARIABLES
# //////////////////////////////
#variable "aws_access_key" {}

#variable "aws_secret_key" {}

variable "region" {
  default = "us-east-2"
}

variable "vpc_cidr" {
  default = "172.16.0.0/16"
}

variable "subnet1_cidr" {
  default = "172.16.0.0/24"
}


