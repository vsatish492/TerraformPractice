variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "tfbucketdemo123"
}

variable "ami" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0f88e80871fd81e91"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "Name tag for EC2 instance"
  type        = string
  default     = "TerraformInstance"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
  default     = "us-east-1a"
}

variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
  default     = "TerraformVPC"
}