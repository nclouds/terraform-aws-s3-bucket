variable "identifier" {
  description = "The name of the security group"
  type        = string
}

variable "force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error"
  default     = false
  type        = bool
}

variable "acl" {
  description = "The canned ACL to apply"
  default     = "private"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resource"
  default     = {}
  type        = map
}
