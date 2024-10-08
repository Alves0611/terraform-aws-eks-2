resource "aws_eks_node_group" "eks_managed_node_group" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.project_name}-nodegroup"
  node_role_arn   = aws_iam_role.eks_mng_role.arn
  instance_types  = ["t3.medium"]
  subnet_ids = [
    var.subnet_private_1a,
    var.subnet_private_1b,
    var.subnet_private_1c
  ]
  tags = (
    {
      Name = "${var.project_name}-nodegroup"
    }
  )

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_mng_role_attachment_worker,
    aws_iam_role_policy_attachment.eks_mng_role_attachment_ecr,
    aws_iam_role_policy_attachment.eks_mng_role_attachment_cni
  ]
}
