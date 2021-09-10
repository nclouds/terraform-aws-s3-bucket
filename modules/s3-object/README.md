# terraform-aws-s3-object

Terraform module that creates an S3 object.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Modules

No Modules.

## Resources

| Name |
|------|
| [aws_s3_bucket_object](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_object) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| acl | The canned ACL to apply | `string` | `"private"` | no |
| bucket | The name of the bucket to put the file in | `string` | n/a | yes |
| file\_source | The path to a file that will be read and uploaded as raw bytes for the object content | `string` | n/a | yes |
| key | The name of the object once it is in the bucket | `string` | n/a | yes |
| storage\_class | Specifies the desired Storage Class for the object | `string` | `"STANDARD"` | no |
| tags | Tags to be applied to the resource | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| output | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contributing
If you want to contribute to this repository check all the guidelines specified [here](.github/CONTRIBUTING.md) before submitting a new PR.
