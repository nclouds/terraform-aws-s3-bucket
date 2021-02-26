module "s3" {
  source     = "../../../.."
  identifier = var.identifier
  tags       = var.tags
}

module "file" {
  source      = "../.."
  file_source = "utils/file.txt"
  bucket      = module.s3.output.bucket.id
  tags        = var.tags
  key         = "file.txt"
}