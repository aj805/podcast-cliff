# implement ./modules/podcast-cliff-infra for dev env

provider "aws" {
  region = "us-west-2" # Replace with your desired AWS region
}

module "podcast-cliff-infra" {
  source = "../../modules/podcast-cliff-infra"

  environment = "dev"

  pg_password_secret_name = "dev/shared"
  pg_password_secret_key  = "podcast-cliff/dev/postgres/0/password"

  redis_auth_secret_name = "dev/shared"
  redis_auth_secret_key  = "podcast-cliff/dev/redis/0/auth-token"

}
