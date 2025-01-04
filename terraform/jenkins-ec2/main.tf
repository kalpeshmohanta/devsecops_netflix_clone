provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_name = "kalpesh-vpc"
  vpc_cidr = var.vpc_cidr
}

module "ec2" {
  source = "./modules/ec2"

  instance_name   = "netflix-jenkins"
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key_name
  subnet_id       = module.vpc.public_subnets
  security_groups = [aws_security_group.netflix_jenkins_sg.id]
  ebs_volume_size = var.ebs_volume_size
}

resource "aws_security_group" "netflix_jenkins_sg" {
  name        = "netflix-jenkins-sg"
  description = "Allow SSH, HTTP, and HTTPS traffic"
  vpc_id      = module.vpc.vpc_id

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

resource "aws_eip" "netflix_jenkins_eip" {
  instance = module.ec2.instance_id
  domain   = "vpc" # Use "vpc" for VPC-bound EIPs
}