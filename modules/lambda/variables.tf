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
  type        = number
  description = ""
}

variable "function_name" {
  default     = ""
  type        = string
  description = "A unique name for your Lambda Function"
}

variable "handler" {
  default     = "" 
  type        = string
  description = "Lambda Function entrypoint in code"
}

variable "memory_size" {
  default     = 128
  type        = number
  description = "Amount of memory in MB your Lambda Function can use at runtime. Valid value between 128 MB to 3008 MB, in 64 MB increments."
}

variable "runtime" {
  default     = ""
  type        = string
  description = "Lambda Function runtime"
}

variable "timeout" {
  default     = 120
  type        = number
  description = "The amount of time your Lambda Function has to run in seconds."
}

variable "lambda_role_arn_module" {
  description = "IAM role attached to the Lambda Function."
}

variable "common_tags" {
  default     = {}
  type        = map
  description = "Common resource tags"
}

variable "s3_bucket_id_module" {
  description = ""
}

variable "s3_bucket_arn_module" {
  description = ""
}
