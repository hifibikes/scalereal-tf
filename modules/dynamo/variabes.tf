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

variable "name" {
  default     = null
  type        = string
  description = "The name dynamodb table"
}

variable "billing_mode" {
  type        = string
  description = "DynamoDB Billing mode. Can be PROVISIONED or PAY_PER_REQUEST"
}

variable "hash_key" {
  default     = null
  type        = string
  description = "DynamoDB table Hash Key"
}

variable "range_key" {
  default     = null
  type        = string
  description = "DynamoDB table Range Key"
}

variable "read_capacity" {
  default     = null
  type        = number
  description = "The number of read units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0"
}

variable "write_capacity" {
  default     = null
  type        = number
  description = "The number of write units for this table. If the billing_mode is PROVISIONED, this field should be greater than 0"
}

variable "stream_enabled" {
  default     = false
  type        = bool
  description = "Enable DynamoDB streams."
}

variable "stream_view_type" {
  default     = ""
  type        = string
  description = "When an item in the table is modified, what information is written to the stream"
}

variable "ttl_enabled" {
  default     = false
  type        = bool
  description = "Indicates whether ttl is enabled"
}

variable "ttl_attribute_name" {
  default     = ""
  type        = string
  description = "The name of the table attribute to store the TTL timestamp in"
}

/*
variable "attributes" {
  default     = null
  type        = string
  description = ""
}

variable "global_secondary_indexes" {
  default     = null
  type        = string
  description = ""
}

variable "timeouts" {
  default     = null
  type        = string
  description = ""
}
*/


