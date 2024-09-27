output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.id
}

output "oidc" {
  description = "The OIDC issuer URL for the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}