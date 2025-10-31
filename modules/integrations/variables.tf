variable "s3_integration_arn" {
  description = "IAM role ARN used by Snowflake storage integration"
  type        = string
}

variable "s3_bucket_name" {
  description = "S3 bucket name"
  type        = string
}