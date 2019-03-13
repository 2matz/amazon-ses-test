provider "aws" {
  region = "us-west-2" // Oregon
}

data "aws_caller_identity" "main" {}
data "aws_region" "main" {}