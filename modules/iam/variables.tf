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

variable "role_name" {
  default     = null
  type        = string
  description = "The name of the role. If omitted, Terraform will assign a random, unique name."
}

variable "iam_description" {
  default     = null
  type        = string
  description = "The description of the role."
}

variable "detach_policy" {
  default     = null
  type        = bool
  description = "Specifies to force detaching any policies the role has before destroying it."
}

variable "policy_name" {
  default     = null
  type        = string
  description = ""
}

variable "common_tags" {
  default     = {}
  type        = map
  description = "Common resource tags"
}