output "sonarQube_pubIP" {
  value = aws_instance.sonarQube-Host.public_ip
}