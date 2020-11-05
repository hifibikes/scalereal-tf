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

variable "region" {
  default     = null 
  type        = string
  description = "AWS region where bucket will be hosted, defaults to provider region"
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

variable "versioning_enabled" {
  default     = false
  type        = bool 
  description = "Boolean specifying enabled state of versioning or object containing detailed versioning configuration."
}

variable "versioning_mfa" {
  default     = false
  type        = bool 
  description = "Boolean specifying mfa for versioning."
}

variable "bucket" {
  default     = ""
  type        = string
  description = "The name of the bucket. (forces new resource, default: unique random name)"
}

variable "bucket_name" {
  default     = null
  type        = string
  description = "The name of the bucket. If omitted, Terraform will assign a random, unique name."
}

variable "bucket_prefix" {
  default     = null
  type        = string
  description = "Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket. (forces new resource)"
}

variable "bucket_acl" {
  type        = string
  description = " The canned ACL to apply. Conflicts with grant. Allowed vaules, private, public etc."
}

variable "force_destroy" {
  default     = false
  type        = bool 
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
}

variable "common_tags" {
  default     = {}
  type        = map
  description = "Common resource tags"
}
