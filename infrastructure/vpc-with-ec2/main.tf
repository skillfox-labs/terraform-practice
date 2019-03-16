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
# Subnets
#
resource "aws_subnet" "subnet_public_az_a" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "10.0.0.0/20"
  availability_zone = "us-west-2a"

  tags = {
    Name = "Public Subnet - A"
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

#
# S3 Bucket
#
resource "aws_s3_bucket" "state_bucket" {
  bucket = "sflstate"
  acl    = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${aws_kms_key.mykey.arn}"
        sse_algorithm     = "aws:kms"
      }
    }
  }

  tags = {
    Name = "Skillfox Labs State"
  }
}
