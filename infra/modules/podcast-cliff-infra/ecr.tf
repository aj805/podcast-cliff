resource "aws_ecr_repository" "podcast_cliff" {
  name                 = "podcast-cliff"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }

  encryption_configuration {
    encryption_type = "AES256"
  }

  tags = {
    Name        = "podcast-cliff"
    Environment = var.environment
    Project     = "PodcastCliff"
  }
}

resource "aws_ecr_lifecycle_policy" "podcast_cliff" {
  repository = aws_ecr_repository.podcast_cliff.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "Keep last 30 images"
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = 30
      }
      action = {
        type = "expire"
      }
    }]
  })
}
