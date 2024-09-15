variable "cluster_id" {
  type = string
}

variable "node_type" {
  type = string
}

variable "num_cache_nodes" {
  type = number
}

variable "parameter_group_name" {
  type = string
}

variable "subnet_group_name" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "vpc_id" {
  type = string
}

variable "redis_auth_secret_name" {
  type        = string
  description = "Name of the secret in AWS Secrets Manager that contains the Redis auth token"
}

variable "redis_auth_secret_key" {

  type        = string
  description = "Key in the secret that contains the Redis auth token"
}
