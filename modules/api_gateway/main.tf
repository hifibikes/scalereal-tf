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
  tags = merge(
    var.common_tags,
    {
      Name = var.api_name
    }
  )
}

# ================================================
# AWS IAM ROLE DEFINITION
# Create IAM role for lambda function
# ================================================
resource "aws_api_gateway_rest_api" "auth_api" {
  count          = var.resource_count
  name           = var.api_name
  api_key_source = var.api_key_source
  tags           = local.tags

  endpoint_configuration {
    types = [
      var.endpoint_type
    ]
  }

}

