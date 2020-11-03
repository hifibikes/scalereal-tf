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

  tags = merge(
    var.common_tags,
    {
      Resource = "S3-Bucket"
    }
  )
}

# =======================================================
# CREATE AWS S3 OBJECT STORAGE
# Creating S3 resource for invoking to lambda function
# =======================================================
resource "aws_s3_bucket" "lambda_bucket" {
  count         = var.resource_count
  bucket        = "${var.bucket_name}-0%${count.index + 1}"
  region        = var.region
  acl           = var.bucket_acl
  force_destroy = var.force_destroy
  request_payer = var.request_payer

  versioning {
    enabled    = var.versioning_enabled
    mfa_delete = var.versioning_mfa
  }

  tags = merge(
    local.tags,
    {
      Name = "${title(var.bucket_name)}-0${count.index + 1}"
    }
  )
}
