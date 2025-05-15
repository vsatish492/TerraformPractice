# Main.tf

# Specify the Terraform version
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "tfmultitier123"
    key            = "tfmultitier123/backend/backend.tf"
    region         = "us-east-1"
    encrypt        = true
  }
}

# Configure the AWS provider
provider "aws" {
  region = "us-east-1"
}


module "vpc" {
  source              = "./modules/vpc"
  cidr_block          = var.vpc_cidr_block
  subnet_cidr_block   = var.subnet_cidr_block
  availability_zone   = var.availability_zone
  name                = var.vpc_name
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}

module "ec2" {
  source        = "./modules/ec2"
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = module.vpc.subnet_id
  name          = var.instance_name
}