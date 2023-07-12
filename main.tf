locals {
  identifier = var.append_workspace ? "${var.identifier}-${terraform.workspace}" : var.identifier
  tags       = merge(module.common_tags.output, var.tags)
}

module "common_tags" {
  source      = "github.com/nclouds/terraform-aws-common-tags?ref=v0.1.2"
  environment = terraform.workspace
  name        = local.identifier
}

#tfsec:ignore:aws-s3-enable-bucket-logging
resource "aws_s3_bucket" "bucket" {
  force_destroy = var.force_destroy
  bucket        = local.identifier
  tags          = local.tags
}

resource "aws_s3_bucket_server_side_encryption_configuration" "sse" {
  bucket = aws_s3_bucket.bucket.id

  # Bucket Encryption
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = try(var.sse_algorithm, "AES256")
      kms_master_key_id = try(var.kms_master_key_id, null)
    }
  }
}

resource "aws_s3_bucket_public_access_block" "bucket_public_access" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

#tfsec:ignore:aws-s3-enable-versioning
resource "aws_s3_bucket_versioning" "bucket_versioning" {

  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = var.versioning_state
  }
}

resource "aws_s3_bucket_logging" "bucket_logs" {
  count         = var.enable_logs ? 1 : 0
  bucket        = aws_s3_bucket.bucket.id
  target_bucket = aws_s3_bucket.log_bucket[count.index].id
  target_prefix = "log/"
}

################
# LOGGING BUCKET
################

#tfsec:ignore:aws-s3-enable-bucket-logging
resource "aws_s3_bucket" "log_bucket" {
  count         = var.enable_logs ? 1 : 0
  force_destroy = var.force_destroy
  bucket        = "${local.identifier}-logs"
  tags          = local.tags
}

resource "aws_s3_bucket_server_side_encryption_configuration" "log_sse" {
  count  = var.enable_logs ? 1 : 0
  bucket = aws_s3_bucket.log_bucket[count.index].id

  # Bucket Encryption
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = try(var.log_bucket_sse_algorithm, "AES256")
      kms_master_key_id = try(var.log_bucket_kms_master_key_id, null)
    }
  }
}

resource "aws_s3_bucket_public_access_block" "log_bucket_public_access" {
  count  = var.enable_logs ? 1 : 0
  bucket = aws_s3_bucket.log_bucket[count.index].id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

#tfsec:ignore:aws-s3-enable-versioning
resource "aws_s3_bucket_versioning" "log_bucket_versioning" {
  count  = var.enable_logs ? 1 : 0
  bucket = aws_s3_bucket.log_bucket[count.index].id
  versioning_configuration {
    status = var.log_bucket_versioning_state
  }
}

