output "Rout53_NameServer" {
    value = aws_route53_zone.JenCont-zone.name_servers
}