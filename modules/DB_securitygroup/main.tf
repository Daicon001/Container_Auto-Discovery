# Provision Database SecurityGroup
resource "aws_security_group" "Database_sg" { 
  name= var.security-group_Name
  vpc_id= var.vpc_id
  tags = {
    Name = var.security-group_Name
  }
}

resource "aws_security_group_rule" "allow_http" {
  type="ingress"
  security_group_id = aws_security_group.Database_sg.id
  from_port = var.mysql
  to_port = var.mysql
  protocol = "tcp"
  cidr_blocks = [var.vpc_cidr]
}
resource "aws_security_group_rule" "allow_outgoing" {
    type = "egress"
    security_group_id = aws_security_group.Database_sg.id
    from_port       = 0
     to_port         = 0
     protocol        = "-1"
     cidr_blocks     = [var.all_cidr]
}