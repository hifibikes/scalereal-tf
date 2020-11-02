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
# locals {
# }

module "s3_lambda_bucket" {
  source = "../modules/s3"

  # mandatory variables
  resource_count = 1
  environment    = "Dev"
  bucket_acl     = "private"

  # optional variables
  request_payer  = "BucketOwner" 

}

# moduel "create_lambda_function" {
#   source = "../modules/lambda"

#   # reference variable
#   s3_bucket_id_module = module.bucket_id
# }
