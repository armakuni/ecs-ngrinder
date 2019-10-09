remote_state {
  backend = "s3"
  config = {
    bucket = "${get_env("PLATFORM_NAME", "ngrider-cluster")}-state"
    key = "${path_relative_to_include()}/terraform.tfstate"
    region = get_env("AWS_REGION", "eu-west-2")
    encrypt = true
    dynamodb_table = "${get_env("PLATFORM_NAME", "ngrider-cluster")}-state"
  }
}

inputs = {
    aws_region = get_env("AWS_REGION", "eu-west-2")
}

terraform {
  source = "terraform"
}