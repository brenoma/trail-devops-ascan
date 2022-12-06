terraform {
  required_version = ">=0.13.1"
  required_providers {
    aws = ">=4.40.0"
    local = ">=2.2.3"
  }
}

provider "aws" {
  region = "us-east-1"
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}