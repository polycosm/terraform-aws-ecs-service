resource "aws_route53_record" "service" {
  for_each = var.load_balancer == null || var.zone == null ? [] : [var.zone]

  zone_id = each.id
  name    = var.hostname
  type    = "A"

  alias {
    evaluate_target_health = false
    name                   = var.load_balancer.dns_name
    zone_id                = var.load_balancer.zone_id
  }
}
