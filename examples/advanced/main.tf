resource "aws_kms_key" "key" {
  deletion_window_in_days = 7
  enable_key_rotation     = true
  description             = "This key is used to encrypt bucket objects"
}

module "s3" {
  source                       = "../.."
  identifier                   = var.identifier
  force_destroy                = "true"
  versioning_state             = "Enabled"
  log_bucket_versioning_state  = "Enabled"
  enable_logs                  = true
  sse_algorithm                = "aws:kms"
  kms_master_key_id            = aws_kms_key.key.key_id
  log_bucket_sse_algorithm     = "aws:kms"
  log_bucket_kms_master_key_id = aws_kms_key.key.key_id
}

module "file" {
  source      = "../../modules/s3-object"
  file_source = "utils/file.txt"
  bucket      = module.s3.output.bucket.id
  key         = "file.txt"
}