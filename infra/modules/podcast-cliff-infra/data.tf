# Get information about the current AWS account
data "aws_caller_identity" "current" {}

# Get information about the current AWS region
data "aws_region" "current" {}

# Get information about the VPC by filtering on the Name tag
data "aws_vpc" "this" {
  filter {
    name   = "tag:Name"
    values = [var.environment]
  }
}

# Get information about the subnets within the VPC
data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.this.id]
  }
  filter {
    name   = "tag:type"
    values = ["private"]
  }
}

locals {
  private_subnets = data.aws_subnets.private.ids
}

# Get the latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
