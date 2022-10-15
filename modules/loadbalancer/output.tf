output "Jencontainer-tg" {
    value = aws_lb_target_group.Jencontainer-tg.arn
}
output "JenContainer-lb" {
    value = aws_lb.JenContainer-lb.dns_name
}
output "JenContainer-lb-zoneID" {
    value = aws_lb.JenContainer-lb.zone_id
}