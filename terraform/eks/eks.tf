# Generates a random string of 8 characters (without special characters) to make the cluster name unique
resource "random_string" "suffix" {
  length  = 8
  special = false
}

# Creates a local variable for cluster name that combines "abhi-eks-" with a random string
locals {
  cluster_name = "kalpesh-eks-${random_string.suffix.result}"
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "20.8.4"
  cluster_name    = local.cluster_name
  cluster_version = var.kubernetes_version
  subnet_ids      = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id



  # Enable public access to the cluster endpoint
  cluster_endpoint_public_access = true
  
  # Optionally restrict access to specific IPs
  cluster_endpoint_public_access_cidrs = ["0.0.0.0/0"]  # Be careful with this in production
  
  # Enable private access as well for nodes
  cluster_endpoint_private_access = true



  # Enable cluster creator admin permissions (IAM ROOT User)
  enable_cluster_creator_admin_permissions = true

  # Enable IAM Roles for Service Accounts(IRSA), which allow K8s service accounts to access AWS IAM roles
  enable_irsa = true

  

  eks_managed_node_group_defaults = {
    ami_type               = "AL2_x86_64"
    instance_types         = ["t3.medium"]
    vpc_security_group_ids = [aws_security_group.all_worker_mgmt.id]
  }

  eks_managed_node_groups = {

    node_group = {
      desired_size = 2
      min_size     = 2
      max_size     = 3
    }
  }
  
}

