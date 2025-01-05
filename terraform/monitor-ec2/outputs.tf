output "vpc_id" {
  description = "ID of the existing VPC of jenkins-ec2"
  value       = var.existing_vpc_id
}

output "subnet_id" {
  description = "ID of the existing subnet of jenkins-ec2"
  value       = var.existing_subnet_id
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = module.ec2.instance_id
}

output "elastic_ip" {
  description = "The Elastic IP associated with the EC2 instance"
  value       = aws_eip.netflix_monitoring_eip.public_ip
}