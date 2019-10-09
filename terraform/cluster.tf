resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.platform_name}-${random_id.platform_name_suffix.hex}"
}

