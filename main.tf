locals {
  identifier = var.append_workspace ? "${var.identifier}-${terraform.workspace}" : var.identifier
  default_tags = {
    Environment = terraform.workspace
    Name        = local.identifier
  }
  tags = merge(local.default_tags, var.tags)
}

resource "aws_s3_bucket" "bucket" { #tfsec:ignore:AWS002 #tfsec:ignore:AWS077
  force_destroy = var.force_destroy
  bucket        = local.identifier
  acl           = var.acl

  #TODO support the other types of encryption
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = local.tags
}
