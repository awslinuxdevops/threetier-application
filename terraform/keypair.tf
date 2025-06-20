resource "aws_key_pair" "labsquire_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)

  tags = {
    Name = "${var.project_name}-key"
  }
}
