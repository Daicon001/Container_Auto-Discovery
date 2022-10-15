# Provision Ansible node
resource "aws_instance" "Ansible_Auto_D_Node" {
  ami                    = var.Ansible_ami
  instance_type          = var.instance_type
  availability_zone      = var.az_A
  key_name               = var.keyname
  associate_public_ip_address = var.ass_pub_ip_address
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.securitygroup_id]
  user_data              = templatefile("~/myproject/Module-EC2-AutoD/modules/ansible_auto_discovery/user_data.sh",
    {
      NewRelic = var.NewRelicLicence,
      Dummy_pubIP = var.Dummy_pubIP
    }
  ) 
  tags = {
    Name = var.Ansible_Node_Name
  }
}