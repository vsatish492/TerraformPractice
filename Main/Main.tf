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
}

# Configure the AWS provider
provider "aws" {
    region = "us-east-1"
}

# Example resource: Create an S3 bucket
terraform {
  backend "s3" {
    bucket         = "tfbucketdemo123"
    key            = "tfbucketdemo123/backend/backend.tf"
    region         = "us-east-1"
    encrypt = true
    
  }
}
data "aws_vpcs" "existing" {}  # Gets all VPCs in the region

data "aws_vpc" "selected" {
  id = data.aws_vpcs.existing.ids[0]  # Selects the first VPC found
}
data "aws_subnets" "available" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0f88e80871fd81e91"
  instance_type = "t3.micro"
  subnet_id     = data.aws_subnets.available.ids[0]  # Use first available subnet
  # ... other configurations ...
    tags = {
        Name = "TerraformInstance"
    }
}  
resource "aws_instance" "example" {
  
}