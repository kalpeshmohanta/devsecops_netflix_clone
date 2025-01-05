variable "instance_name" {
  description = "The name of the EC2 instance"
  type        = string
}

variable "availability_zone" {
  description = "The availability zone to launch the instance in"
  type        = string
}

variable "ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
}

variable "key_name" {
  description = "The name of the existing key pair"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID where the EC2 instance will be launched"
  type        = string
}

variable "security_groups" {
  description = "List of security group IDs for the EC2 instance"
  type        = list(string)
}

variable "ebs_volume_size" {
  description = "The size of the EBS volume in GiB"
  type        = number
}