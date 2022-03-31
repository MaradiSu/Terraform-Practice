resource "aws_instance" "app_server" {
  ami           = "ami-06a0b4e3b7eb7a300"
  instance_type = var.aws_instance_type

  tags = {
    #Name = "ExampleAppServerInstance"
    Name = var.aws_instance_name
  }
}

