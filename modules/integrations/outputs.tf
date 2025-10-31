output "s3_integration_name" {
  description = "Name of the Snowflake storage integration"
  value       = snowflake_storage_integration.s3_integration.name
}