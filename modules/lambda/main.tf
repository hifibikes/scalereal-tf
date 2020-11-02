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
  lambda_function = "lambda_trigger"
  archive_type    = "zip"
}


# ==========================================================
# TERRAFORM DATA SOURCES
# Archive python code to be executed inside lambda function
# ===========================================================
data "archive_file" "trigger_function" {
  type        = local.archive_type 
  source_file = "${path.module}/scripts/${local.lambda_function}.py"
  output_path = "${path.module}/scripts/${local.lambda_function}.zip"
}

# ====================================================================
# TERRAFORM LAMBDA FUNCTION RESOURCE
# Create terraform lambda function to execute sample python function 
# ======================================================================
resource "aws_lambda_function" "s3_file_trigger" {
  count            = var.resource_count
  function_name    = var.function_name
  role             = ""
  handler          = var.handler
  memory_size      = var.memory_size
  runtime          = var.runtime
  layers           = var.layers
  timeout          = local.timeout
  publish          = local.publish
  tags             = var.tags
  source_code_hash = filebase64sha256(data.archive_file.trigger_function.output_path)

  depends_on = [
    data.archive_file.trigger_function,
  ]
}

# ====================================================================
# TERRAFORM S3 NOTIFICATION RESOURCE
# Adding S3 bucket as trigger to my lambda and giving the permissions
# ====================================================================
resource "aws_s3_bucket_notification" "lambda_file_trigger" {
  count     = var.resource_count
  bucket    = aws_s3_bucket.lambda_bucket.id
  
  lambda_function {
    lambda_function_arn = aws_lambda_function.nonprod_lambda.arn
    events              = [
      "s3:ObjectCreated:*",
    ]
    filter_prefix       = "file-prefix"
    filter_suffix       = "file-extension"
  }
}


# ====================================================================
# TERRAFORM LAMBDA FUNCTION PERMISSION RESOURCE
# 
# ====================================================================
resource "aws_lambda_permission" "lambda_permission" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.nonprod_lambda.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = "arn:aws:s3:::${aws_s3_bucket.lambda_bucket.id}"
}
