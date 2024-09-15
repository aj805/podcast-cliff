data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_secretsmanager_secret" "redis_auth" {
  name = var.redis_auth_secret_name
}

data "aws_secretsmanager_secret_version" "redis_auth" {
  secret_id = data.aws_secretsmanager_secret.redis_auth.id
}

locals {
  redis_auth_token = sensitive(jsondecode(data.aws_secretsmanager_secret_version.redis_auth.secret_string)[var.redis_auth_secret_key])
}
