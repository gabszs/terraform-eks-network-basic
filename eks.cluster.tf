resource "aws_eks_cluster" "this" {
  name                      = var.eks_cluster.eks_cluster_name
  role_arn                  = aws_iam_role.eks_cluster.arn
  version                   = var.eks_cluster.eks_cluster_version
  enabled_cluster_log_types = var.eks_cluster.enabled_cluster_log_types

  access_config {
    authentication_mode = var.eks_cluster.authentication_mode
  }

  vpc_config {
    subnet_ids = aws_subnet.private_sa_east[*].id
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSClusterPolicy
  ]
}

