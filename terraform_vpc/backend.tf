terraform {
  backend "s3" {
    bucket         = "labsquire-dev-terraform-state"
    key            = "dev-labs/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "labsquire-dev-lock-table"
    encrypt        = true
  }
}
