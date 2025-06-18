resource "aws_s3_bucket" "labsquire_dev_flow_logs" {
  bucket        = "labsquire-dev-vpc-flow-logs" # Make sure this name is globally unique
  force_destroy = true

  tags = {
    Name = "Labsquire Dev Flow Logs"
  }
}
