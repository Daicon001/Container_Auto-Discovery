output "Bastion_IP" {
  value = aws_instance.Bastion-Host.public_ip
}