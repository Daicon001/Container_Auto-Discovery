resource "aws_route53_zone" "JenCont-zone" {
  name          = var.domain_name
  force_destroy = true
}
resource "aws_route53_record" "JenCont-www" {
  zone_id = aws_route53_zone.JenCont-zone.zone_id
  name    = var.domain_name
  type    = var.type
  alias {
    name                   = var.lb_dns-name
    zone_id                = var.lb_zone_id
    evaluate_target_health = true
  }
}