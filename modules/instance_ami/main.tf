#Creating ami from instance
resource "aws_ami_from_instance" "instance-ami" {
  name               = var.instance-ami_name
  source_instance_id = var.instance_id
  tags = {
    Name = var.instance_Name
  }
}