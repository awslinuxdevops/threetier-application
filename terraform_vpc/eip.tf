resource "aws_eip" "ec2_eip" {
  domain = "vpc"

  tags = {
    Name = "${var.project_name}-eip"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.labsquire_ec2.id
  allocation_id = aws_eip.ec2_eip.id
}
