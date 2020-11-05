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

# ====================================================================
# TERRAFORM AWS-DYNAMODB RESOURCE
# Create AWS Dynamo-DB  
# ======================================================================

resource "aws_dynamodb_table" "dynamo_csv" {
  count = var.resource_count

  name             = var.name
  billing_mode     = var.billing_mode
  hash_key         = var.hash_key
  range_key        = var.range_key
  read_capacity    = var.read_capacity
  write_capacity   = var.write_capacity

  ttl {
    enabled        = var.ttl_enabled
    attribute_name = var.ttl_attribute_name
  }

  dynamic "attribute" {
    for_each = var.attributes

    content {
      type = attribute.value.type
      name = attribute.value.name
    }
  }

  global_secondary_index {
    name               = var.gsi_name
    hash_key           = var.hash_key
    range_key          = var.range_key
    projection_type    = var.projection_type
    read_capacity      = var.read_capacity
    write_capacity     = var.write_capacity
    non_key_attributes = [
      var.hash_key
    ]
  }

  tags = merge(
    var.common_tags,
    {
      "Name" = title(var.name)
    }
  )

}
