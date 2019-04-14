#
# main.tf - Property of Skillfox Labs LLC
#
provider "aws" {
  # Terraform AWS provider version.
  version = ">= 1.58"
  region  = "${var.aws_region}"
}

#
# VPC
#
resource "aws_vpc" "main" {
  cidr_block                       = "10.0.0.0/16"
  instance_tenancy                 = "default"
  enable_dns_support               = true
  enable_dns_hostnames             = false
  assign_generated_ipv6_cidr_block = false

  tags = {
    Name = "Small VPC"
  }
}

#
# Internet Gateway
#
resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "main"
  }
}

#
# KMS Key for S3
#
resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}
