locals {
  plaform_name = "${var.platform_name}-${random_id.platform_name_suffix.hex}"
}

resource "aws_iam_role" "task_execution_role" {
  name = local.plaform_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "task_execution_role_policy_attachement" {
  role       = aws_iam_role.task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_ecs_cluster" "ecs_cluster" {
  name = local.plaform_name
}

data "aws_vpc" "default_vpc" {
  default = true
}

resource "aws_security_group" "security_group" {
  vpc_id = data.aws_vpc.default_vpc.id
  name   = local.plaform_name
}

resource "aws_security_group_rule" "http_ingress" {
  from_port         = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.security_group.id
  to_port           = 80
  cidr_blocks       = ["0.0.0.0/0"]
  type              = "ingress"
}

