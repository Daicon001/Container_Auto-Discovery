output "Ansible_pubIP" {
  value = aws_instance.Ansible_Auto_D_Node.public_ip
}
output "Ansible_prvIP" {
  value = aws_instance.Ansible_Auto_D_Node.private_ip
}