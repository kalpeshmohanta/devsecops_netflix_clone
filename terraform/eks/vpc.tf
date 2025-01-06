# Gets a list of all available AWS availability zones in your selected region
data "aws_availability_zones" "available" {}


# Creates a VPC using an official AWS VPC module from the Terraform registry
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.7.0"

  name                 = "kalpesh-eks-vpc"
  cidr                 = var.vpc_cidr
  azs                  = data.aws_availability_zones.available.names
  private_subnets      = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets       = ["10.0.4.0/24", "10.0.5.0/24"]
  enable_nat_gateway   = true      # Enables NAT Gateway for private subnets to access internet
  single_nat_gateway   = true      # Uses just one NAT Gateway (saves cost)
  enable_dns_hostnames = true      # Enables DNS hostnames in the VPC
  enable_dns_support   = true      # Enables DNS support in the VPC


  tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}
