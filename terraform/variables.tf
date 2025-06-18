variable "aws_region" {}
variable "project_name" {}
variable "vpc_cidr" {}
variable "labsquire_network" {}

variable "public_subnet_cidrs" {
  type = list(string)
}

variable "private_subnet_cidrs" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

variable "ec2_ami_id" {
  description = "AMI ID for EC2"
  type        = string
}

variable "ec2_instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}


variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "public_key_path" {
  description = "SSH key pair name"
  type        = string
}

variable "ec2_availability_zone" {
  description = "Availability Zone for EC2 and EBS volume"
  type        = string
}
