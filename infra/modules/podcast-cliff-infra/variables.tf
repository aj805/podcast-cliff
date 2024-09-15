variable "environment" {
  type        = string
  description = "Environment (e.g., dev, staging, prod)"
}

variable "postgres_instance_class" {
  type        = string
  description = "RDS instance class for Postgres"
  default     = "db.t3.micro"
}

variable "postgres_allocated_storage" {
  type        = number
  description = "Allocated storage for Postgres RDS (in GB)"
  default     = 20
}

variable "redis_node_type" {
  type        = string
  description = "ElastiCache node type for Redis"
  default     = "cache.t3.micro"
}

variable "redis_num_cache_nodes" {
  type        = number
  description = "Number of cache nodes for Redis cluster"
  default     = 1
}

variable "pg_password_secret_name" {
  type        = string
  description = "Name of the secret in AWS Secrets Manager that contains the Postgres password"
}

variable "pg_password_secret_key" {
  type        = string
  description = "Key of the secret in AWS Secrets Manager that contains the Postgres password"
}

variable "redis_auth_secret_name" {
  type        = string
  description = "Name of the secret in AWS Secrets Manager that contains the Redis auth token"
}

variable "redis_auth_secret_key" {
  type        = string
  description = "Key in the secret that contains the Redis auth token"
}

