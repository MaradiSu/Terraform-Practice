terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  access_key = ""
  secret_key = "/"
  region  = "ap-south-1"
}
# EC2 is the resource
# resource "aws-instnace" "local_name"{
  # AMI = "ami-0f9c9e9b7e6c69f1f"

#}
resource "aws_instance" "app_server" {
  ami           = "ami-06a0b4e3b7eb7a300"
  key_name               = "Training-Key"
  instance_type = "t2.micro"
vpc_security_group_ids = [aws_security_group.http_server_sg.id]

  //subnet_id              = "subnet-3f7b2563"
  //subnet_id = tolist(data.aws_subnet_ids.default_subnets.ids)[0]

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ec2-user"
    private_key = file("Training-Key.pem")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo service httpd start",
      "echo Welcome ALL to teh course - Virtual Server is at ${self.public_dns} | sudo tee /var/www/html/index.html"
    ]
  }

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

  
resource "aws_security_group" "http_server_sg" {
  name = "sample_http_server_sg"
  #vpc_id = "vpc-c49ff1be"
 vpc_id = aws_default_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name = "http_server_sg"
  }
}

resource "aws_default_vpc" "default" {

}

output "http_server_public_dns" {
  value = aws_instance.app_server.public_dns
}

data "aws_subnet_ids" "default_subnets" {
  vpc_id = aws_default_vpc.default.id
}

data "aws_ami" "aws_linux_2_latest" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
}

data "aws_ami_ids" "aws_linux_2_latest_ids" {
  owners = ["amazon"]
}

output "aws_security_group_http_server_details" {
  value = aws_security_group.http_server_sg
}

