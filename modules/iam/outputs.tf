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

output "iam_role_arn" {
  value       = aws_iam_role.lambda_role[*].arn
  description = "ARN of AWS custom role"
}
