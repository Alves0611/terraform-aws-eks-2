variable "aws_region" {
  type        = string
  description = "The region to deploy to"
}

variable "project_name" {
  type        = string
  description = "Project name to be used to name the resources (Name tag)"
}

variable "public_subnet_1a" {
  type        = string
  description = "The ID of the public subnet in availability zone 1a"
}

variable "public_subnet_1b" {
  type        = string
  description = "The ID of the public subnet in availability zone 1b"
}

variable "public_subnet_1c" {
  type        = string
  description = "The ID of the public subnet in availability zone 1c"
}
