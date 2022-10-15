output "vpc_id" {
  description = "vpc ID"
  value       = aws_vpc.JenCont-vpc.id
}
output "PUB_SN1" {
  description = "Public Subnets "
  value       = aws_subnet.JenCont-pub-sn1.id
}
output "PUB_SN2" {
  description = "Public Subnets"
  value       = aws_subnet.JenCont-pub-sn2.id
}
output "PRV_SN1" {
  description = "Private Subnets "
  value       = aws_subnet.JenCont-prv-sn1.id
}
output "PRV_SN2" {
  description = "Private Subnets "
  value       = aws_subnet.JenCont-prv-sn2.id
}
