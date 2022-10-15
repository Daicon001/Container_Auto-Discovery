# Provision Jenkins,SonaQube and Docker_host SecurityGroup
resource "aws_security_group" "DocJenSona_sg" { 
  name= var.security-group_Name
  vpc_id= var.vpc_id
  tags = {
    Name = var.security-group_Name
  }
}

resource "aws_security_group_rule" "allow_http" {
  description = "Allow http port which is port 80"
  type="ingress"
  security_group_id = aws_security_group.DocJenSona_sg.id
  from_port = var.http_port
  to_port = var.http_port
  protocol = "tcp"
  cidr_blocks = [var.all_cidr]
}
resource "aws_security_group_rule" "allow_ssh" {
  description = "Allow ssh port which is port 22"
  type = "ingress"
  security_group_id = aws_security_group.DocJenSona_sg.id
  from_port = var.ssh_port
  to_port = var.ssh_port
  protocol = "tcp"
  cidr_blocks = [var.all_cidr]
}
resource "aws_security_group_rule" "allow_sona" {
  description = "Allow sonar port which is port 9000"
  type = "ingress"
  security_group_id = aws_security_group.DocJenSona_sg.id
  from_port = var.sona_port
  to_port = var.sona_port
  protocol = "tcp"
  cidr_blocks = [var.all_cidr]
}
resource "aws_security_group_rule" "allow_custom" {
  description = "Allow custom port which is port 8080"
  type = "ingress"
  security_group_id = aws_security_group.DocJenSona_sg.id
  from_port = var.custom_http
  to_port = var.custom_http
  protocol = "tcp"
  cidr_blocks = [var.all_cidr]
}
resource "aws_security_group_rule" "allow_outgoing" {
    type = "egress"
    security_group_id = aws_security_group.DocJenSona_sg.id
    from_port       = 0
     to_port         = 0
     protocol        = "-1"
     cidr_blocks     = [var.all_cidr]
}








# # Provision Jenkins, sonarQube Docker_host SecurityGroup
# resource "aws_security_group" "DocJenSona_sg" {
#   name= var.security-group_Name
#   vpc_id= var.vpc_id

#   ingress {
#     description = "Allow all traffic"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = [var.all_cidr]
#   }
#   ingress {
#     description = "Allow ssh port which is port 22"
#     from_port   = var.ssh_port
#     to_port     = var.ssh_port
#     protocol    = "tcp"
#     cidr_blocks = [var.all_cidr]
#   }
#   ingress {
#     description = "Allow sonar port which is port 9000"
#     from_port = var.sona_port
#     to_port = var.sona_port
#     protocol = "tcp"
#     cidr_blocks = [var.all_cidr]
#   }
#   ingress {
#     description = "Allow custom port which is port 8080"
#     from_port   = var.custom_http
#     to_port     = var.custom_http
#     protocol    = "tcp"
#     cidr_blocks = [var.all_cidr]
#   }

#   ingress {
#     description = "Allow http port which is port 80"
#     from_port   = var.http_port
#     to_port     = var.http_port
#     protocol    = "tcp"
#     cidr_blocks = [var.all_cidr]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = [var.all_cidr]
#   }
#   tags = {
#     Name = var.security-group_Name
#   }
# }
