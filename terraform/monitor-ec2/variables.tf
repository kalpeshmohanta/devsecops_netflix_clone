variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "ap-south-1" # India- Mumbai
}

variable "availability_zone" {
  description = "The availability zone to deploy resources"
  type        = string
  default     = "ap-south-1a"
}

variable "existing_vpc_id" {
  description = "ID of the existing VPC of jenkins-ec2"
  type        = string
  default     = "vpc-04927282036c4f10e"
}

variable "existing_subnet_id" {
  description = "ID of the existing subnet of jenkins-ec2"
  type        = string
  default     = "subnet-0a6cc9fd3198c27e7"
}

variable "ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-053b12d3152c0cc71" # Updated AMI for ap-south-1(Mumbai region)
}

variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
  default     = "t2.medium"
}

variable "key_name" {
  description = "The name of the existing key pair"
  type        = string
  default     = "aws_key_pair"
}

variable "ebs_volume_size" {
  description = "The size of the EBS volume in GiB"
  type        = number
  default     = 20
}