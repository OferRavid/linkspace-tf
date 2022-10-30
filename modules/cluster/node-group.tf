# Create EKS cluster node group
resource "aws_eks_node_group" "node" {
  cluster_name = aws_eks_cluster.eks_cluster.name
  subnet_ids = concat([for value in range(var.public-subnet-number) : var.public-subnet-obj[value].id],
  [for value in range(var.private-subnet-number) : var.private-subnet-obj[value].id])
  node_group_name = "${var.environment_name}${var.name}-nodes-group"
  node_role_arn   = aws_iam_role.iam_role_eks_nodes.arn
  instance_types  = var.nodes-group.instance_types
  scaling_config {
    desired_size = var.nodes-group.scaling_config.desired_size
    max_size     = var.nodes-group.scaling_config.max_size
    min_size     = var.nodes-group.scaling_config.min_size
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly
  ]
  provisioner "local-exec" {
    command = "aws eks --region ${var.region} update-kubeconfig --name ${aws_eks_cluster.eks_cluster.name} && kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.10.0/cert-manager.crds.yaml "
  }
}