terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

#############################
# VPC
#############################

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "example-vpc"
  }
}

#############################
# S3 Bucket (depends implicitly on VPC)
#############################

resource "aws_s3_bucket" "example" {
  bucket = "example-bucket-${aws_vpc.main.id}"

  # Adding VPC ID into the bucket name (or tags) creates an implicit dependency.
  # Terraform will create the VPC first automatically.
  tags = {
    Name = "example-bucket"
    VPC  = aws_vpc.main.id
  }
}

