resource "aws_security_group" "service" {
  name   = "${var.name}-ecs-service"
  vpc_id = var.network.vpc_id

  tags = {
    Name = "${var.name}-ecs-service"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "ingress_port" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = var.port
  protocol          = "tcp"
  security_group_id = aws_security_group.service.id
  to_port           = var.ingress_port
  type              = "ingress"
}

resource "aws_security_group_rule" "egress_all" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.service.id
  to_port           = 0
  type              = "egress"
}
