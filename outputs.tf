output "arn" {
  value = aws_ecs_service.service.id
}

output "security_group_id" {
  value = aws_security_group.service.id
}
