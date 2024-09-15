data "aws_iam_policy_document" "deploy_lambda" {
  statement {
    effect = "Allow"
    actions = [
      "lambda:UpdateFunctionCode",
      "lambda:UpdateFunctionConfiguration",
      "lambda:GetFunctionConfiguration",
      "lambda:GetFunction"
    ]
    resources = [
      "arn:aws:lambda:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:function:podcast*"
    ]
  }
}

resource "aws_iam_role" "deploy_lambda" {
  name               = "gha-deploy-lambda"
  description        = "Github Actions access to deploy lambda"
  assume_role_policy = data.aws_iam_policy_document.deploy_lambda.json

  inline_policy {
    name   = "deploy_lambda"
    policy = data.aws_iam_policy_document.deploy_lambda.json
  }
}
