locals {
  tags = merge(module.common_tags.output, var.tags)
}

module "common_tags" {
  source      = "github.com/nclouds/terraform-aws-common-tags?ref=v0.1.2"
  environment = terraform.workspace
  name        = var.key
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
