provider "aws" {
  region = var.aws_region
}


module "ec2" {
  source = "./modules/ec2"

  instance_name   = "netflix-monitoring"
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_id        = var.existing_subnet_id
  security_groups = [aws_security_group.netflix_monitoring_sg.id]
  ebs_volume_size = var.ebs_volume_size
  availability_zone = var.availability_zone
}

resource "aws_security_group" "netflix_monitoring_sg" {
  name        = "netflix-monitoring-sg"
  description = "Allow SSH, HTTP, and HTTPS traffic"
  vpc_id      = var.existing_vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_eip" "netflix_monitoring_eip" {
  instance = module.ec2.instance_id
  domain   = "vpc" # Use "vpc" for VPC-bound EIPs
}