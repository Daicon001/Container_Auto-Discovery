#Creating autoscaling
resource "aws_launch_configuration" "instance-asg-lc" {
  name            = var.instance-as-lc-Name
  instance_type   = var.instance_type
  image_id        = var.image_id
  security_groups = [var.securitygroup_id]
  key_name        = var.keyname
  associate_public_ip_address = var.ass_pub_ip_address
  user_data       = <<-EOF
  #!/bin/bash
  sudo systemctl enable docker
  sudo setenforce 0
  sudo systemctl start docker
  sudo docker start pet-adoption-container
  EOF 
}