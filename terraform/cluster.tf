locals {
  plaform_name = "${var.platform_name}-${random_id.platform_name_suffix.hex}"
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = local.plaform_name
}

data "aws_vpc" "default_vpc" {
  default = true
}

resource "aws_security_group" "security_group" {
  vpc_id = data.aws_vpc.default_vpc.id
  name = local.plaform_name
}

resource "aws_security_group_rule" "http_ingress" {
  from_port         = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.security_group.id
  to_port           = 80
  cidr_blocks = ["0.0.0.0/0"]
  type              = "ingress"
}

