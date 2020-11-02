/**
 * 
 * 
 * Copyright 2020 ITWox Inc.
 * 
 * All rights reserved in ITWox Inc.
 *
 */

# ================================================
# DECLARE TERRAFORM LOCALS
# ================================================
locals {
  lambda_zip_location = "outputs/welcome.zip"
  filename            = "welcome.py"
  handler             = "welcome.hello"
  type                = "zip"
  bucket_name         = "dev-lambda-bucket-us-east-1"
}


# ========================================================
# TERRAFORM DATA SOURCES
# Zipped python code to execute inside lambda function
# ========================================================
data "archive_file" "lambda_func" {
  type        = local.type 
  source_file = local.filename
  output_path = local.lambda_zip_location
}

# ====================================================================
# TERRAFORM LAMBDA FUNCTION RESOURCE
# Create terraform lambda function to execute sample python function 
# ======================================================================
resource "aws_lambda_function" "nonprod_lambda" {
  count         = 
  filename      = data.archive_file.lambda_func.output_path
  function_name = var.function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = local.handler 
  timeout       = var.timeout

  source_code_hash = filebase64sha256(local.lambda_zip_location)

  runtime = var.runtime

#   depends_on = [
#     data.archive_file.welcome,    
#   ]
}

##################
# Creating s3 resource for invoking to lambda function
##################

resource "aws_s3_bucket" "lambda_bucket" {
bucket = local.bucket_name
acl    = "private"
tags = {
Name        = "lambda_bucket"
Environment = "Dev"
}
}

##################
# Adding S3 bucket as trigger to my lambda and giving the permissions
##################
resource "aws_s3_bucket_notification" "aws-lambda-trigger" {
bucket = aws_s3_bucket.lambda_bucket.id
lambda_function {
lambda_function_arn = aws_lambda_function.nonprod_lambda.arn
events              = ["s3:ObjectCreated:*"]
filter_prefix       = "file-prefix"
filter_suffix       = "file-extension"
}
}

resource "aws_lambda_permission" "lambda_permission" {
statement_id  = "AllowS3Invoke"
action        = "lambda:InvokeFunction"
function_name = aws_lambda_function.nonprod_lambda.function_name
principal = "s3.amazonaws.com"
source_arn = "arn:aws:s3:::${aws_s3_bucket.lambda_bucket.id}"
}