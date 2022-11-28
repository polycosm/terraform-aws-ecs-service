resource "aws_lb_target_group" "service" {
  name        = "${var.name}-private"
  port        = var.port
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = var.network.vpc_id

  tags = {
    Name = "${var.name}-private"
  }
}

resource "aws_lb_listener_rule" "service" {
  listener_arn = var.load_balancer.https_listener_id

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.service.id
  }

  condition {
    host_header {
      values = [
        var.hostname,
      ]
    }
  }
}
