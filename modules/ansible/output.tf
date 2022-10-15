output "Ansible_IP" {
  value = aws_instance.Ansible-Node.public_ip
}