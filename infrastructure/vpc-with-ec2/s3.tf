#
# s3.tf - Property of Skillfox Labs LLC
#
# Creates an S3 Bucket
#  - server side encryption with KMS.
#  - blocks public policies & access control lists.
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

resource "aws_s3_bucket_public_access_block" "state_bucket" {
  bucket = "${aws_s3_bucket.state_bucket.id}"

  block_public_acls   = true
  block_public_policy = true
}
