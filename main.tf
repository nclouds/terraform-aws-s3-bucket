locals {
  identifier = var.append_workspace ? "${var.identifier}-${terraform.workspace}" : var.identifier
  default_tags = {
    Environment = terraform.workspace
    Name        = local.identifier
  }
  tags = merge(local.default_tags, var.tags)
}

#tfsec:ignore:AWS002 #tfsec:ignore:AWS077 #tfsec:ignore:AWS098 #tfsec:ignore:AWS017
resource "aws_s3_bucket" "bucket" {
  force_destroy = var.force_destroy
  bucket        = local.identifier
  tags          = local.tags
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = var.acl
}

resource "aws_s3_bucket_server_side_encryption_configuration" "sse" {
  bucket = aws_s3_bucket.bucket.id

  #TODO support the other types of encryption
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
