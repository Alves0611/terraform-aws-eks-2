variable "aws_region" {
  type        = string
  description = "The region to deploy to"
}

variable "project_name" {
  type        = string
  description = "Project name to be used to name the resources (Name tag)"
}

variable "cidr_block" {
  type        = string
  description = "Networking CIDR block to be used for the VPC"
}
