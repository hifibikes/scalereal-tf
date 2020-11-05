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
 
output "bucket_id" {
  value       = aws_s3_bucket.lambda_bucket[*].id
  description = "The name of the bucket."
}

output "bucket_arn" {
  value       = aws_s3_bucket.lambda_bucket[*].arn
  description = "The ARN of the bucket. Will be of format arn:aws:s3:::bucketname."
}
