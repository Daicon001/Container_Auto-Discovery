output "instance-ami" {
    value = aws_ami_from_instance.instance-ami.id
}