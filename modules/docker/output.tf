output "docker_id" {
  value = aws_instance.JenCont-Docker-Server.id
}
output "Docker_prvIP" {
  value = aws_instance.JenCont-Docker-Server.private_ip
}
output "Docker_pubIP" {
  value = aws_instance.JenCont-Docker-Server.public_ip
}
output "Docker_ami" {
  value = aws_instance.JenCont-Docker-Server.ami  
}