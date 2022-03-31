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