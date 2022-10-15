output "Jenkins_prvIP" {
  value = aws_instance.Jenkins-Host.private_ip
}
output "Jenkins_pubIP" {
  value = aws_instance.Jenkins-Host.public_ip
}
output "Jenkins-lb_id" {
  value = aws_instance.Jenkins-Host.id  
}