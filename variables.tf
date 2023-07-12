variable "identifier" {
  description = "The name of the security group"
  type        = string
}

variable "force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error"
  default     = false
  type        = bool
}

variable "tags" {
  description = "Tags to be applied to the resource"
  default     = {}
  type        = map(any)
}

variable "append_workspace" {
  description = "Appends the terraform workspace at the end of resource names, <identifier>-<worspace>"
  default     = true
  type        = bool
}

# S3 Bucket Public Access Settings
variable "block_public_acls" {
  description = "Whether Amazon S3 should block public ACLs for this bucket. Defaults to false. Enabling this setting does not affect existing policies or ACLs. When set to true causes the following behavior: PUT Bucket acl and PUT Object acl calls will fail if the specified ACL allows public access, PUT Object calls will fail if the request includes an object ACL."
  default     = true
}

variable "block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for this bucket. Defaults to false. Enabling this setting does not affect the existing bucket policy. When set to true causes Amazon S3 to:Reject calls to PUT Bucket policy if the specified bucket policy allows public access."
  default     = true
}

variable "ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for this bucket. Defaults to false. Enabling this setting does not affect the persistence of any existing ACLs and doesn't prevent new public ACLs from being set. When set to true causes Amazon S3 to:Ignore public ACLs on this bucket and any objects that it contains."
  default     = true
}

variable "restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket. Defaults to false. Enabling this setting does not affect the previously stored bucket policy, except that public and cross-account access within the public bucket policy, including non-public delegation to specific accounts, is blocked. When set to true: Only the bucket owner and AWS Services can access this buckets if it has a public policy."
  default     = true
}

# VERSIONING
variable "versioning_state" {
  description = "The versioning state of the bucket. Valid values: Enabled, Suspended, or Disabled. Disabled should only be used when creating or importing resources that correspond to unversioned S3 buckets."
  default     = "Disabled"
}

variable "log_bucket_versioning_state" {
  description = "The versioning state of the Logging bucket. Valid values: Enabled, Suspended, or Disabled. Disabled should only be used when creating or importing resources that correspond to unversioned S3 buckets."
  default     = "Disabled"
}

# LOGGING
variable "enable_logs" {
  description = "Whether to enable log on the bucket. Enabling this will create a Logging S3 bucket where the access logs for this bucket will be stored"
  default     = false
}

# ENCRYPTION
variable "sse_algorithm" {
  description = "The server-side encryption algorithm to use the bucket. Valid values are AES256 and aws:kms"
  default     = "AES256"
}

variable "kms_master_key_id" {
  description = "The AWS KMS master key ID used for the SSE-KMS encryption for the Bucket if `enable_logs` is set to true. This can only be used when you set the value of sse_algorithm as aws:kms. The default aws/s3 AWS KMS master key is used if this element is absent while the sse_algorithm is aws:kms."
  default     = null
}

#LOGGING BUCKET ENCRYPTION
variable "log_bucket_sse_algorithm" {
  description = "The server-side encryption algorithm to use the log bucket if `enable_logs` is set to true. Valid values are AES256 and aws:kms"
  default     = "AES256"
}

variable "log_bucket_kms_master_key_id" {
  description = "The AWS KMS master key ID used for the SSE-KMS encryption for Logging Bucket if `enable_logs` is set to true. This can only be used when you set the value of sse_algorithm as aws:kms. The default aws/s3 AWS KMS master key is used if this element is absent while the sse_algorithm is aws:kms."
  default     = null
}
