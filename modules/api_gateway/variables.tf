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
  description = "Number or resource count to be created by terraform"
}

variable "api_name" {
  type        = string
  description = "Name for the rest api gateway"
}

variable "api_key_source" {
  default     = "HEADER"
  type        = string
  description = "The source of the API key for requests. Valid values are HEADER and AUTHORIZER"
}

variable "endpoint_type" {
  default     = null
  type        = string
  description = "Gateway endpoint, supported values, REGIONAL, EDGE & PRIVATE"
}

variable "common_tags" {
  default     = {}
  type        = map
  description = "Common resource tags"
}

