output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_az_a_cidr" {
  value = aws_subnet.public_a.id
}
output "public_subnet_az_b_cidr" {
  value = aws_subnet.public_b.id
}

output "private_subnet_az_a_id" {
  value = aws_subnet.private_a.id
}

output "private_subnet_az_b_id" {
  value = aws_subnet.private_b.id
}

output "bastion_sg_id" {
  value = aws_security_group.bastion.id
}

output "private_sg_id" {
  value = aws_security_group.private_instances.id
}

output "public_web_sg_id" {
  value = aws_security_group.public_web.id
}

