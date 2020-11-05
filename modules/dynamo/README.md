# AWS DynamoDB Table Terraform module

Terraform module to create a DynamoDB table.

## Terraform versions

Terraform 0.12 or newer is supported.

## Usage

```hcl
module "dynamodb_table" {
  source   = "terraform-aws-modules/dynamodb-table/aws"

  name     = "my-table"
  hash_key = "id"

  attributes = [
    {
      name = "id"
      type = "N"
    }
  ]

  tags = {
    Terraform   = "true"
    Environment = "staging"
  }
}
```
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.6, < 0.14 |
| aws | >= 2.52, < 4.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.52, < 4.0 |


## Authors

Module written by [Aftab Shaikh] and managed by [ITWOx Inc](https://itwox.com/).

## License

Copyright 2020 ITWox Inc.
 
 * All rights reserved in ITWox Inc. authored and generated code, including the
 * selection and arrangement of the source code base regardless of the authorship
 * of individual files.......
