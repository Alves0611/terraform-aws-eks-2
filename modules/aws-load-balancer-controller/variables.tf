variable "project_name" {
  type        = string
  description = "Project name to be used to name the resources (Name tag)"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "oidc" {
  type        = string
  description = "HTTPS URL from OIDC provider of the EKS cluster"
}
