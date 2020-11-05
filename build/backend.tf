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


terraform {
  backend "s3" {
    bucket = "scalereal-terraform-state" 
    key    = "dev/scalereal-app.tfstate"
    region = "us-east-1"
  }
}
