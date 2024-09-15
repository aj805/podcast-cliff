module "postgres" {
  source = "../postgres"

  pg_password_secret_name = var.pg_password_secret_name
  pg_password_secret_key  = var.pg_password_secret_key

  allocated_storage    = var.postgres_allocated_storage
  engine_version       = "16.4"
  instance_class       = var.postgres_instance_class
  db_name              = "podcast-cliff-${var.environment}"
  username             = "podcastcliff"
  parameter_group_name = "default.postgres16"

  vpc_security_group_ids = [aws_security_group.postgres.id]
  db_subnet_group_name   = aws_db_subnet_group.podcast_cliff.name
  vpc_id                 = data.aws_vpc.this.id

  tags = {
    Environment = var.environment
    Project     = "PodcastCliff"
  }

}

module "redis" {
  source = "../redis"

  redis_auth_secret_name = var.redis_auth_secret_name
  redis_auth_secret_key  = var.redis_auth_secret_key

  cluster_id           = "podcast-cliff-${var.environment}"
  node_type            = var.redis_node_type
  num_cache_nodes      = var.redis_num_cache_nodes
  parameter_group_name = "default.redis7"
  subnet_group_name    = aws_elasticache_subnet_group.podcast_cliff.name
  security_group_ids   = [aws_security_group.redis.id]
  vpc_id               = data.aws_vpc.this.id

  tags = {
    Environment = var.environment
    Project     = "PodcastCliff"
  }
}

resource "aws_security_group" "postgres" {
  name        = "podcast-cliff-postgres-${var.environment}"
  description = "Security group for Podcast Cliff Postgres"
  vpc_id      = data.aws_vpc.this.id

  ingress {
    description = "Allow PostgreSQL traffic"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.this.cidr_block] # Consider restricting this more in production
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "podcast-cliff-postgres-${var.environment}"
    Environment = var.environment
    Project     = "PodcastCliff"
  }
}

resource "aws_security_group" "redis" {
  name        = "podcast-cliff-redis-${var.environment}"
  description = "Security group for Podcast Cliff Redis"
  vpc_id      = data.aws_vpc.this.id

  ingress {
    description = "Allow Redis traffic"
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.this.cidr_block] # Consider restricting this in production
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "podcast-cliff-redis-${var.environment}"
    Environment = var.environment
    Project     = "PodcastCliff"
  }
}

resource "aws_db_subnet_group" "podcast_cliff" {
  name       = "podcast-cliff-${var.environment}"
  subnet_ids = data.aws_subnets.private.ids

  tags = {
    Name        = "podcast-cliff-${var.environment}"
    Environment = var.environment
    Project     = "PodcastCliff"
  }
}

resource "aws_elasticache_subnet_group" "podcast_cliff" {
  name       = "podcast-cliff-${var.environment}"
  subnet_ids = data.aws_subnets.private.ids

  tags = {
    Name        = "podcast-cliff-${var.environment}"
    Environment = var.environment
    Project     = "PodcastCliff"
  }
}
