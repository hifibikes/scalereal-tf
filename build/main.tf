/**
 * 
 * 
 * Copyright 2020 ITWox Inc.
 * 
 * All rights reserved in ITWox Inc. authored and generated code, including the
 * selection and arrangement of the source code base regardless of the authorship
 * of individual files.......
 *
 */
locals {
  resource_count = 1
  
  common_tags = {
    Environment = title(var.environment)
    Costcenter  = var.costcenter
    Department  = title(var.department)
    Owner       = title(var.resource_owner)
    Contact     = title(var.technical_owner)
    Managed_by  = "Terraform"
  }
}

module "s3_lambda_bucket" {
  source = "../modules/s3"
  
  bucket_name    = "lambda-s3-bucket"
  resource_count = local.resource_count
  environment    = "Dev"
  bucket_acl     = "private"
  request_payer  = "BucketOwner"
  common_tags    = local.common_tags
}

module "lambda_iam_role" {
  source = "../modules/iam"
  
  resource_count  = local.resource_count
  role_name       = "CustomIAMRoleForLambda"
  iam_description = "IAM role for lambda for s3 access"
  common_tags     = local.common_tags
}


# moduel "create_lambda_function" {
#   source = "../modules/lambda"

#   # reference variable
#   s3_bucket_id_module = module.bucket_id
# }
