terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.93"
    }
  }

  backend "s3" {
    bucket       = "aws-live-estudo-redes-tf-s3-state-bucket"
    region       = "sa-east-1"
    key          = "env/terraform.tfstate"
    use_lockfile = true
  }
  required_version = "~> 1.10"
}

provider "aws" {
  region = "sa-east-1"

  default_tags {
    tags = var.default_tags
  }
}

