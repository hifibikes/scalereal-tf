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
variable "region" {
  default     = "us-east-1"
  type        = string
  description = "The region where AWS resources will be deploy"
}

variable "access_key" {
  type        = string
  description = "AWS access key to authenticate to aws cloud"
}

variable "secret_key" {
  type        = string
  description = "AWS secret key to authenticate to aws cloud"
}

variable "environment" {
  default     = "dev" 
  type        = string
  description = "Resource environment"
}

variable "costcenter" {
  default     = "123456" 
  type        = string
  description = "Costcenter to bear the resources cost on AWS"
}

variable "department" {
  default     = "technology" 
  type        = string
  description = ""
}

variable "resource_owner" {
  default     = "admins"
  type        = string
  description = "Name of the resource owner, dba, admin, operation, developers etc"
}

variable "technical_owner" {
  default     = "aftab"
  type        = string
  description = "Name of the technical for contact"  
}

variable "resource_type" {
  default     = "scalereal-app"
  type        = string
  description = "Type of the resource created by terraform, app, db, lb, cfg etc."
}

variable "backend_bucket" {
  type        = string
  description = "AWS S3 bucket name for remote tfstate backend preservation."
}

