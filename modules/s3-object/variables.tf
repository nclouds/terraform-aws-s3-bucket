variable "storage_class" {
  description = "Specifies the desired Storage Class for the object"
  default     = "STANDARD"
  type        = string
}

variable "bucket" {
  description = "The name of the bucket to put the file in"
  type        = string
}

variable "key" {
  description = "The name of the object once it is in the bucket"
  type        = string
}

variable "file_source" {
  description = "The path to a file that will be read and uploaded as raw bytes for the object content"
  type        = string
}

variable "acl" {
  description = "The canned ACL to apply"
  default     = "private"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resource"
  default     = {}
  type        = map(any)
}
