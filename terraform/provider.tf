provider "aws" {
  region = var.aws_region
}

provider "random" {}

resource "random_id" "platform_name_suffix" {
  byte_length = 8
}

terraform {
  backend "s3" {}
}