data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_secretsmanager_secret" "pg_password" {
  name = var.pg_password_secret_name
}

data "aws_secretsmanager_secret_version" "pg_password" {
  secret_id = data.aws_secretsmanager_secret.pg_password.id
}

locals {
  pg_password = sensitive(jsondecode(data.aws_secretsmanager_secret_version.pg_password.secret_string)[var.pg_password_secret_key])
}
