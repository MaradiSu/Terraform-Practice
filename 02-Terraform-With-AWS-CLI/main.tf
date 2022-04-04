# //////////////////////////////
# VARIABLES
# //////////////////////////////
# Syntax for variables:

# Variable "variable_name"{
#   description = "description"
#   default = "default"
# }
/*variable  "aws_access_key" {
  description = "AWS Access Key"
 default = ""
}
variable "aws_secret_key"{
description = "AWS Secret Key"
default=""
}*/


variable "aws_instance_name" {
  description = "AWS Instance Name"
  type        = string #any, number, string, boolean, object, list
  default     = "test-instance"
}
variable "aws_instance_type" {
  description = "AWS Instance Type"
  type        = string # true or false 

  default = "t2.micro"
  #default = true
}
variable "aws_region" {
  description = "AWS Region"
  default     = "ap-south-1"
}
# //////////////////////////////
# Terraform Configuration
# //////////////////////////////
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

# //////////////////////////////
# RESOURCES
# //////////////////////////////
resource "aws_instance" "app_server" {
  ami           = "ami-06a0b4e3b7eb7a300"
  instance_type = var.aws_instance_type

  tags = {
    #Name = "ExampleAppServerInstance"
    Name = var.aws_instance_name
  }
}

#Outputs
# //////////////////////////////
# OUTPUTS
# //////////////////////////////
# Syntax for outputs:
#output "example_name"{
#  value = "example_value"
#}
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}
output "aws_instace_type" {
  description = "AWS Instance Type"
  value       = aws_instance.app_server.instance_type

}

