variable "kubernetes_version" {
  type        = string
  default     = "1.28"
  description = "kubernetes version"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "default CIDR range of the VPC"
}
variable "aws_region" {
  default = "ap-south-1"
  description = "aws region (india- Mumbai)"
}

