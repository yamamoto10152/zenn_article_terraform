# Storage Integration
resource "snowflake_storage_integration" "s3_integration" {
  name                      = "S3_INTEGRATION"
  comment                   = "For yamamoto10152"
  type                      = "EXTERNAL_STAGE"
  enabled                   = true
  storage_allowed_locations = ["s3://${var.s3_bucket_name}/snowpipe/"]
  storage_provider     = "S3"
  storage_aws_role_arn = var.s3_integration_arn
}

