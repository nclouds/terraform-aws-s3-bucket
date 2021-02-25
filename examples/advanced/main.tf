module "s3" {
  source        = "../.."
  identifier    = var.identifier
  tags          = var.tags
  force_destroy = "true"
  acl           = "public-read"
}

module "file" {
  source      = "../../modules/s3-object"
  file_source = "utils/file.txt"
  bucket      = module.s3.output.bucket.id
  tags        = var.tags
  key         = "file.txt"
}