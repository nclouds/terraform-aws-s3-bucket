locals {
  default_tags = {
    Environment = terraform.workspace
  }
  tags = merge(local.default_tags, var.tags)
}

resource "aws_s3_object" "object" {
  storage_class = var.storage_class
  bucket        = var.bucket
  source        = var.file_source
  etag          = filemd5(var.file_source)
  acl           = var.acl
  key           = var.key
  tags          = local.tags

}
