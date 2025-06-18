resource "aws_vpc" "labs-dev" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.labs-dev.id
  tags = {
    Name = "${var.project_name}-igw"
  }
}


resource "aws_flow_log" "labsquire_dev_flow_logs" {
  log_destination      = aws_s3_bucket.labsquire_dev_flow_logs.arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = aws_vpc.labs-dev.id
}


