#create keypairs for ec2 instance
resource "aws_key_pair" "JenCont_Key" {
  key_name   = var.key_name
  public_key = file(var.path_to_public_key)
}