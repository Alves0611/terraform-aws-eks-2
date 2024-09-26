terraform {
  required_version = "~> 1.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.22"
    }
  }
  backend "s3" {
    bucket = "tfstate-891377404175"
    key    = "eks-module/dev/terraform.tfstate"
    region = "us-east-1"
  }
}
