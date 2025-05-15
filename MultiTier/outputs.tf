output "s3_bucket_arn" {
  value = module.s3.bucket_arn
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "subnet_id" {
  value = module.vpc.subnet_id
}