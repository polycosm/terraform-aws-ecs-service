resource "aws_route53_record" "service" {
  for_each = var.load_balancer == null || var.zone == null ? [] : [var.zone]

  zone_id = each.id
  name    = "${var.name}.${var.domain_name}"
  type    = "A"

  alias {
    evaluate_target_health = false
    name                   = aws_lb.service.dns_name
    zone_id                = aws_lb.service.zone_id
  }
}
