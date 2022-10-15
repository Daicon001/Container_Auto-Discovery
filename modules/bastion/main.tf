# Provisioning Bastion Host
resource "aws_instance" "Bastion-Host" {
  ami                         = var.Bastion_ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  availability_zone           = var.az_A
  key_name                    = var.keyname
  vpc_security_group_ids      = [var.securitygroup_id]
  associate_public_ip_address = var.ass_pub_ip_address

  provisioner "file" {
    source      = "~/keypairs/test-key"
    destination = "/home/ec2-user/test-key"
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/keypairs/test-key")
    host        = self.public_ip
  }
  user_data = <<-EOF
    #!/bin/bash
    sudo hostnamectl set-hostname Bastion
    sudo chmod 400 /home/ec2-user/test-key
    EOF
  tags = {
    Name = var.Bastion_Host_Name
  }
}