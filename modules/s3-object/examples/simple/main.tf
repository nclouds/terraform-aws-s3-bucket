module "s3" {
  source     = "../../../.."
  identifier = var.identifier
}

module "file" {
  source      = "../.."
  file_source = "utils/file.txt"
  bucket      = module.s3.output.bucket.id
  key         = "file.txt"
}