# Get information about the current AWS account
data "aws_caller_identity" "current" {}

# Get information about the current AWS region
data "aws_region" "current" {}

# Get information about the VPC
data "aws_vpc" "this" {
  filter {
    name   = "tag:Name"
    values = [var.environment]
  }
}

# # Get information about the subnets
# TODO get subnets by tag type:public|private
# data "aws_subnet" "this" {
#   count = length(var.subnet_ids)
#   id    = var.subnet_ids[count.index]
# }
