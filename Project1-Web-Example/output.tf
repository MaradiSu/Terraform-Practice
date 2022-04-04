# //////////////////////////////
# OUTPUT
# //////////////////////////////
output "instance-dns" {
  value = aws_instance.nodejs1.public_dns
}
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.nodejs1.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.nodejs1.public_ip
}
