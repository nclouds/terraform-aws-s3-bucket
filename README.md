<p align="left"><img width=400 height="100" src="https://www.nclouds.com/img/nclouds-logo.svg"></p>  

![Terraform](https://github.com/nclouds/terraform-aws-s3-bucket/workflows/Terraform/badge.svg)
# nCode Library

## Simple Storage Service (S3) Terraform Module

Terraform module to provision [`Simple Storage Service Service`](https://aws.amazon.com/s3) on AWS.

## Usage

### Simple setup

Create a simple S3 bucket with default configurations.
```hcl
    module "s3" {
        source      = "github.com/nclouds/terraform-aws-s3-bucket?ref=v0.3.1"
        identifier  = "example"
        tags        = {
            Owner       = "sysops"
            env         = "dev"
            Cost_Center = "XYZ"
        }
    }
```

For more details on a working example, please visit [`examples/simple`](examples/simple)

### Advanced Setup
If you want to create S3 bucket with enhanced configuration e.g ACLs , force_destory etc. and also objects inside, you can use the module like this:

```hcl
    module "s3" {
        source      = "github.com/nclouds/terraform-aws-s3-bucket?ref=v0.3.1"
        identifier  = "example"
        tags        = {
            Owner       = "sysops"
            env         = "dev"
            Cost_Center = "XYZ"
        }
        force_destroy = "true"
        acl           = "public-read"
    }

    module "file" {
        source      = "github.com/nclouds/terraform-aws-s3-bucket//modules/s3-object?ref=v0.3.1"
        file_source = "utils/file.txt"
        bucket      = module.s3.output.bucket.id
        tags        = {
            Owner       = "sysops"
            env         = "dev"
            Cost_Center = "XYZ"
        }
        key         = "file.txt"
    }
```

For more options refer to a working example at [`examples/advanced`](examples/advanced)

## Examples
Here are some working examples of using this module:
- [`examples/simple`](examples/simple)
- [`examples/advanced`](examples/advanced)

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
| <a name="module_common_tags"></a> [common\_tags](#module\_common\_tags) | github.com/nclouds/terraform-aws-common-tags?ref=v0.1.2 |  |

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket.log_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_logging.bucket_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_logging) | resource |
| [aws_s3_bucket_public_access_block.bucket_public_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_public_access_block.log_bucket_public_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.log_sse](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.sse](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.bucket_versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_s3_bucket_versioning.log_bucket_versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_append_workspace"></a> [append\_workspace](#input\_append\_workspace) | Appends the terraform workspace at the end of resource names, <identifier>-<worspace> | `bool` | `true` | no |
| <a name="input_block_public_acls"></a> [block\_public\_acls](#input\_block\_public\_acls) | Whether Amazon S3 should block public ACLs for this bucket. Defaults to false. Enabling this setting does not affect existing policies or ACLs. When set to true causes the following behavior: PUT Bucket acl and PUT Object acl calls will fail if the specified ACL allows public access, PUT Object calls will fail if the request includes an object ACL. | `bool` | `true` | no |
| <a name="input_block_public_policy"></a> [block\_public\_policy](#input\_block\_public\_policy) | Whether Amazon S3 should block public bucket policies for this bucket. Defaults to false. Enabling this setting does not affect the existing bucket policy. When set to true causes Amazon S3 to:Reject calls to PUT Bucket policy if the specified bucket policy allows public access. | `bool` | `true` | no |
| <a name="input_enable_logs"></a> [enable\_logs](#input\_enable\_logs) | Whether to enable log on the bucket. Enabling this will create a Logging S3 bucket where the access logs for this bucket will be stored | `bool` | `false` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error | `bool` | `false` | no |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | The name of the security group | `string` | n/a | yes |
| <a name="input_ignore_public_acls"></a> [ignore\_public\_acls](#input\_ignore\_public\_acls) | Whether Amazon S3 should ignore public ACLs for this bucket. Defaults to false. Enabling this setting does not affect the persistence of any existing ACLs and doesn't prevent new public ACLs from being set. When set to true causes Amazon S3 to:Ignore public ACLs on this bucket and any objects that it contains. | `bool` | `true` | no |
| <a name="input_kms_master_key_id"></a> [kms\_master\_key\_id](#input\_kms\_master\_key\_id) | The AWS KMS master key ID used for the SSE-KMS encryption for the Bucket if `enable_logs` is set to true. This can only be used when you set the value of sse\_algorithm as aws:kms. The default aws/s3 AWS KMS master key is used if this element is absent while the sse\_algorithm is aws:kms. | `any` | `null` | no |
| <a name="input_log_bucket_kms_master_key_id"></a> [log\_bucket\_kms\_master\_key\_id](#input\_log\_bucket\_kms\_master\_key\_id) | The AWS KMS master key ID used for the SSE-KMS encryption for Logging Bucket if `enable_logs` is set to true. This can only be used when you set the value of sse\_algorithm as aws:kms. The default aws/s3 AWS KMS master key is used if this element is absent while the sse\_algorithm is aws:kms. | `any` | `null` | no |
| <a name="input_log_bucket_sse_algorithm"></a> [log\_bucket\_sse\_algorithm](#input\_log\_bucket\_sse\_algorithm) | The server-side encryption algorithm to use the log bucket if `enable_logs` is set to true. Valid values are AES256 and aws:kms | `string` | `"AES256"` | no |
| <a name="input_log_bucket_versioning_state"></a> [log\_bucket\_versioning\_state](#input\_log\_bucket\_versioning\_state) | The versioning state of the Logging bucket. Valid values: Enabled, Suspended, or Disabled. Disabled should only be used when creating or importing resources that correspond to unversioned S3 buckets. | `string` | `"Disabled"` | no |
| <a name="input_restrict_public_buckets"></a> [restrict\_public\_buckets](#input\_restrict\_public\_buckets) | Whether Amazon S3 should restrict public bucket policies for this bucket. Defaults to false. Enabling this setting does not affect the previously stored bucket policy, except that public and cross-account access within the public bucket policy, including non-public delegation to specific accounts, is blocked. When set to true: Only the bucket owner and AWS Services can access this buckets if it has a public policy. | `bool` | `true` | no |
| <a name="input_sse_algorithm"></a> [sse\_algorithm](#input\_sse\_algorithm) | The server-side encryption algorithm to use the bucket. Valid values are AES256 and aws:kms | `string` | `"AES256"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to the resource | `map(any)` | `{}` | no |
| <a name="input_versioning_state"></a> [versioning\_state](#input\_versioning\_state) | The versioning state of the bucket. Valid values: Enabled, Suspended, or Disabled. Disabled should only be used when creating or importing resources that correspond to unversioned S3 buckets. | `string` | `"Disabled"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_output"></a> [output](#output\_output) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contributing
If you want to contribute to this repository check all the guidelines specified [here](.github/CONTRIBUTING.md) before submitting a new PR.
