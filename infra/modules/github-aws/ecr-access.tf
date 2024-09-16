data "aws_iam_policy_document" "ecr_access" {
  version = "2012-10-17"

  statement {
    effect = "Allow"
    actions = [
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:GetRepositoryPolicy",
      "ecr:DescribeRepositories",
      "ecr:ListImages",
      "ecr:DescribeImages",
      "ecr:BatchGetImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:PutImage"
    ]
    resources = ["*"]
  }

  statement {
    effect = "Allow"
    actions = [
      "ecr:GetAuthorizationToken",
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role" "ecr_acces" {
  name               = "gha-ecr"
  description        = "Github Actions access to ECR"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  inline_policy {
    name   = "ecr_access"
    policy = data.aws_iam_policy_document.ecr_access.json
  }
}
