output "task_execution_role" {
  value = aws_iam_role.task_execution_role.name
}

output "public_subnet_ids" {
  value = module.vpc.public_subnets
}

output "security_group" {
  value = aws_security_group.security_group.id
}