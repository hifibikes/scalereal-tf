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
  lambda_function = "lambda_function"
  function_name   = "S3CSVEventReader"
  handler         = "lambda_function.lambda_handler"
  archive_type    = "zip"
  
  tags = merge(
    var.common_tags,
    {
      Name = "Lambda-Function"
    }
  )
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
  count         = var.resource_count
  function_name = local.lambda_function
  role          = var.lambda_role_arn_module[count.index]
  handler       = local.handler
  memory_size   = var.memory_size
  runtime       = var.runtime
  timeout       = var.timeout
  tags          = local.tags

  filename         = data.archive_file.trigger_function.output_path
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
  bucket    = var.s3_bucket_id_module[count.index]
  
  lambda_function {
    lambda_function_arn = aws_lambda_function.s3_file_trigger[count.index].arn
    filter_suffix       = var.event_filter_suffix
    events              = [
      "s3:ObjectCreated:*",
    ]
  }
}

# ====================================================================
# TERRAFORM LAMBDA FUNCTION PERMISSION RESOURCE
# Lambda permission 
# ====================================================================
resource "aws_lambda_permission" "lambda_permission" {
  count         = var.resource_count
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.s3_file_trigger[count.index].function_name
  principal     = "s3.amazonaws.com"
  source_arn    = var.s3_bucket_arn_module[count.index]
}
