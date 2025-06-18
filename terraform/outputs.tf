output "vpc_id" {
  value = aws_vpc.labs-dev.id
}

output "public_subnets" {
  value = aws_subnet.public[*].id
}

output "private_subnets" {
  value = aws_subnet.private[*].id
}


output "ec2_instance_id" {
  value = aws_instance.labsquire_ec2.id
}

output "ec2_public_ip" {
  value = aws_instance.labsquire_ec2.public_ip
}

output "ec2_eip" {
  value = aws_eip.ec2_eip.public_ip
}
