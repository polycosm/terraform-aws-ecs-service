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

resource "aws_security_group_rule" "ingress" {
  for_each = toset([
    for ingress_port in var.ingress_ports : tostring(ingress_port)
  ])

  security_group_id = aws_security_group.service.id

  type        = "ingress"
  protocol    = "tcp"
  from_port   = each.key
  to_port     = each.key
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "egress_all" {
  for_each = toset([
    for egress_port in var.egress_ports : tostring(egress_port)
  ])

  security_group_id = aws_security_group.service.id

  type        = "egress"
  from_port   = each.key
  to_port     = each.key
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
