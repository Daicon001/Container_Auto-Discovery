# Provision sonarQube Server
resource "aws_instance" "sonarQube-Host" {
  ami                    = var.sonarQube_ami
  instance_type          = var.instance_type
  availability_zone      = var.az_B
  key_name               = var.keyname
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.securitygroup_id]
  associate_public_ip_address = var.ass_pub_ip_address
  user_data = "${file("~/myproject/Module-EC2-AutoD/modules/sonarQube/user_data.sh")}"
  
  tags = {
    Name = var.snarQube_Name
  }
}