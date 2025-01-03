output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = module.ec2.instance_id
}

output "elastic_ip" {
  description = "The Elastic IP associated with the EC2 instance"
  value       = aws_eip.netflix_jenkins_eip.public_ip
}