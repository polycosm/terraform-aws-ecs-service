resource "aws_route53_record" "service" {
  name    = var.hostname
  type    = "A"
  zone_id = var.zone.id

  alias {
    evaluate_target_health = false
    name                   = var.load_balancer.dns_name
    zone_id                = var.load_balancer.zone_id
  }
}
