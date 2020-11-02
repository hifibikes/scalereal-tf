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

# ================================================
# DECLARE TERRAFORM LOCALS
# ================================================
locals {
  bucket_arn = coalesce(
    var.bucket_arn, 
    "arn:aws:s3:::${var.bucket}"
  )

  tags = {
    Environment = var.environment
    Costcenter  = "123456"
    DepartId    = "Technology"  
  }

}

# =======================================================
# CREATE AWS S3 OBJECT STORAGE
# Creating S3 resource for invoking to lambda function
# =======================================================
resource "aws_s3_bucket" "lambda_bucket" {
  count         = var.resource_count
  bucket        = var.bucket_name
  bucket_prefix = var.bucket_prefix
  acl           = var.bucket_acl
  force_destroy = var.force_destroy
  request_payer = var.request_payer

  versioning {
    enabled    = false
    mfa_delete = false
  }

  tags = merge(
    local.tags,
    {
      Name = "S3-Lambda-Bucket-0${index.count}"
    }
  )
}
