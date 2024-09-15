output "postgres_endpoint" {
  description = "The connection endpoint for the Postgres database"
  value       = module.postgres.postgres_endpoint
}

output "redis_endpoint" {
  description = "The connection endpoint for the Redis cluster"
  value       = module.redis.redis_endpoint
}

output "environment" {
  description = "The environment name"
  value       = var.environment
}

output "vpc_id" {
  description = "The ID of the VPC where resources are created"
  value       = data.aws_vpc.this.id
}

output "subnet_ids" {
  description = "The list of subnet IDs where resources are created"
  value       = data.aws_subnets.private.ids
}

output "ecr_repository_url" {
  description = "The URL of the ECR repository"
  value       = aws_ecr_repository.podcast_cliff.repository_url
}

output "redis_url" {
  description = "The Redis URL for connecting to the cluster"
  value       = module.redis.redis_url
  sensitive   = true
}
