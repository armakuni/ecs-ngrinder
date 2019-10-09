locals {
    aws_region = get_env("AWS_REGION", "eu-west-2")
    platform_name = get_env("PLATFORM_NAME", "ngrider-cluster")
}

remote_state {
  backend = "s3"
  config = {
    bucket = "${local.platform_name}-state"
    key = "${path_relative_to_include()}/terraform.tfstate"
    region = local.aws_region
    encrypt = true
    dynamodb_table = "${local.platform_name}-state"
  }
}

inputs = {
    aws_region = local.aws_region
    platform_name = local.platform_name
}

terraform {
  source = "terraform"
}