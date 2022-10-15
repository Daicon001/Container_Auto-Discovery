# 1.create A VPC Infrastructure
resource "aws_vpc" "JenCont-vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}
#  2.create public subnet1. 
resource "aws_subnet" "JenCont-pub-sn1" {
  vpc_id            = aws_vpc.JenCont-vpc.id
  cidr_block        = var.PUB_SN1_cidr
  availability_zone = var.az_A
  tags = {
    Name = var.pub_sn1_tag
  }
}
# 3.create public subnet2. 
resource "aws_subnet" "JenCont-pub-sn2" {
  vpc_id            = aws_vpc.JenCont-vpc.id
  cidr_block        = var.PUB_SN2_cidr
  availability_zone = var.az_B
  tags = {
    Name = var.pub_sn2_tag
  }
}
# 4.create private subnet1
resource "aws_subnet" "JenCont-prv-sn1" {
  vpc_id            = aws_vpc.JenCont-vpc.id
  cidr_block        = var.PRV_SN1_cidr
  availability_zone = var.az_A
  tags = {
    Name = var.prv_sn1_tag
  }
}
# 5.create privat subnet2
resource "aws_subnet" "JenCont-prv-sn2" {
  vpc_id            = aws_vpc.JenCont-vpc.id
  cidr_block        = var.PRV_SN2_cidr
  availability_zone = var.az_B
  tags = {
    Name = var.prv_sn2_tag
  }
}
# 6.internet gateways
resource "aws_internet_gateway" "JenCont-igw" {
  vpc_id = aws_vpc.JenCont-vpc.id
  tags = {
    Name = var.igw_name
  }
}
# 7. creating the EIP
resource "aws_eip" "JenCont_EIP" {
  depends_on = [aws_internet_gateway.JenCont-igw]
}
# 8. creating the NAT gateway
resource "aws_nat_gateway" "JenCont_NAT_GW" {
  allocation_id = aws_eip.JenCont_EIP.id
  subnet_id     = aws_subnet.JenCont-pub-sn1.id

  tags = {
    Name = var.nat_gateway
  }
}
# 9. create a public route table
resource "aws_route_table" "JenCont_PUB_SN_RT" {
  vpc_id = aws_vpc.JenCont-vpc.id

  route {
    cidr_block = var.all_cidr
    gateway_id = aws_internet_gateway.JenCont-igw.id
  }
  tags = {
    Name = var.route_pub_table
  }
}
# 10. create a private route table
resource "aws_route_table" "JenCont_PRV_SN_RT" {
  vpc_id = aws_vpc.JenCont-vpc.id

  route {
    cidr_block = var.all_cidr
    gateway_id = aws_nat_gateway.JenCont_NAT_GW.id
  }
  tags = {
    Name = var.route_prv_table
  }
}
# 11. route table association for Public Subnet1
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.JenCont-pub-sn1.id
  route_table_id = aws_route_table.JenCont_PUB_SN_RT.id
}
#  12. route table association for Public Subnet2
resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.JenCont-pub-sn2.id
  route_table_id = aws_route_table.JenCont_PUB_SN_RT.id
}
#  13. route table association for Private Subnet1. 
resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.JenCont-prv-sn1.id
  route_table_id = aws_route_table.JenCont_PRV_SN_RT.id
  
}
#  14. route table association for Private Subnet2. 
resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.JenCont-prv-sn2.id
  route_table_id = aws_route_table.JenCont_PRV_SN_RT.id
  
}