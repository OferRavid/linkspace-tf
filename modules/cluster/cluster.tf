# Creating the EKS cluster
resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.environment_name}${var.name}-cluster"
  role_arn = aws_iam_role.iam-role-eks-cluster.arn
  version  = var.aws_eks_cluster_version

  # Adding VPC Configuration
  vpc_config {
    security_group_ids = [aws_security_group.eks-cluster-sg.id]
    subnet_ids = concat([for value in range(var.public-subnet-number) : var.public-subnet-obj[value].id],
    [for value in range(var.private-subnet-number) : var.private-subnet-obj[value].id])
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-cluster-AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks-cluster-AmazonEKSServicePolicy
  ]
}



