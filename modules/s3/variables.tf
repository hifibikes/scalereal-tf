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


variable "resource_count" {
  default     = 1
  type        = number
  description = "Resource count to be created, to remove/destroy supply 0, defaults to 1"
}

variable "bucket_arn" {
  default     = null
  type        = string
  description = "ARN of S3 bucket to use in policies"
}

variable "request_payer" {
  default     = "BucketOwner"
  type        = string
  description = "Who should bear the cost of Amazon S3 data transfer. Can be either BucketOwner or Requester."
}

variable "environment" {
  type        = string
  description = "Environment type for bucket, dev, qa, prod, uat etc"
}

variable "verioning_enabled" {
  default     = false
  type        = bool 
  description = ""
}

variable "versioning_mfa" {
  default     = false
  type        = bool 
  description = ""
}

variable "bucket_name" {
  type        = 
  description =
}

variable "bucket_prefix" {
  default     = false
  type        =
  description =  
}

variable "bucket_acl" {
  type        =
  description =
}

varible "force_destroy" {
  type        =
  description =
}
