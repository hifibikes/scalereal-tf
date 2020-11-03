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
      Name = title(var.role_name)
    }
  )
}

# ================================================
# AWS IAM ROLE DEFINITION
# Create IAM role for lambda function
# ================================================
resource "aws_iam_role" "lambda_role" {
  count       = var.resource_count
  name        = var.role_name
  description = var.iam_description
  tags        = local.tags

  assume_role_policy    = file("${path.module}/policies/lambda_arp.json")
  force_detach_policies = var.detach_policy
}

# ================================================
# AWS IAM ROLE POLICY DEFINITION
# Attach role policy to iam role 
# ================================================
resource "aws_iam_role_policy" "lambda_policy" {
  count  = var.resource_count
  name   = var.policy_name
  role   = aws_iam_role.lambda_role[count.index].id
  policy = file("${path.module}/policies/lambda_policy.json")
}
