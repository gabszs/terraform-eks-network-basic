resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = var.eks_cluster.eks_node_group_name
  node_role_arn   = aws_iam_role.eks_node_group.arn
  subnet_ids      = aws_subnet.private_sa_east[*].id

  capacity_type  = var.eks_cluster.capacity_type
  instance_types = var.eks_cluster.instance_types

  scaling_config {
    desired_size = var.eks_cluster.scaling_config.desired_size
    max_size     = var.eks_cluster.scaling_config.max_size
    min_size     = var.eks_cluster.scaling_config.min_size
  }

  #   update_config {
  #     max_unavailable = 1
  #   }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.eks_node_group-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks_node_group-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks_node_group-AmazonEC2ContainerRegistryReadOnly,
  ]
}