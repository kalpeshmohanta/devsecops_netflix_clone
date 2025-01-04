output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.this.id
}

output "public_subnets" {
  description = "The ID of the public subnet"
  value       = aws_subnet.public.id
}