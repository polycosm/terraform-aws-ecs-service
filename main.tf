resource "aws_ecs_service" "service" {
  cluster         = var.cluster.id
  desired_count   = var.initial_desired_count
  launch_type     = "FARGATE"
  name            = var.name
  task_definition = var.task_definition.arn

  # NB: we want to run the service in the private subnets
  network_configuration {
    security_groups = [
      aws_security_group.service.id,
    ]

    subnets = var.network.private_subnets
  }

  # NB: we usually want to route http traffic to the service.
  dynamic "load_balancer" {
    for_each = var.load_balancer_config == null ? [] : [var.load_balancer_config]
    iterator = each

    content {
      target_group_arn = each.value.target_group_arn
      container_name   = each.value.container_name
      container_port   = each.value.container_port
    }
  }

  lifecycle {
    # NB: a service's task count is often managed externally, so we only set the initial count
    ignore_changes = [
      desired_count,
    ]
  }
}
