# terraform-aws-s3-object

Terraform module that creates an S3 object.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_common_tags"></a> [common\_tags](#module\_common\_tags) | github.com/nclouds/terraform-aws-common-tags | v0.1.2 |

## Resources

| Name | Type |
|------|------|
| [aws_s3_object.object](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acl"></a> [acl](#input\_acl) | The canned ACL to apply | `string` | `"private"` | no |
| <a name="input_bucket"></a> [bucket](#input\_bucket) | The name of the bucket to put the file in | `string` | n/a | yes |
| <a name="input_file_source"></a> [file\_source](#input\_file\_source) | The path to a file that will be read and uploaded as raw bytes for the object content | `string` | n/a | yes |
| <a name="input_key"></a> [key](#input\_key) | The name of the object once it is in the bucket | `string` | n/a | yes |
| <a name="input_storage_class"></a> [storage\_class](#input\_storage\_class) | Specifies the desired Storage Class for the object | `string` | `"STANDARD"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to the resource | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_output"></a> [output](#output\_output) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contributing
If you want to contribute to this repository check all the guidelines specified [here](.github/CONTRIBUTING.md) before submitting a new PR.
