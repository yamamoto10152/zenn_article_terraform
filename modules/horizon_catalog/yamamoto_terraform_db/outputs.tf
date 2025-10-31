# Outputs
output "database_name" {
  description = "Name of the Snowflake database"
  value       = snowflake_database.primary.fully_qualified_name
}

output "schema_names" {
  description = "Names of the Snowflake schemas"
  value = [
    snowflake_schema.schema.fully_qualified_name,
    snowflake_schema.schema2.fully_qualified_name,
    snowflake_schema.schema3.fully_qualified_name,
    snowflake_schema.schema4.fully_qualified_name
  ]
}

output "table_name" {
  description = "Name of the Snowflake table"
  value       = snowflake_table.table.fully_qualified_name
}

output "stage_name" {
  description = "Name of the Snowflake stage"
  value       = snowflake_stage.s3_stage.fully_qualified_name
}

output "pipe_name" {
  description = "Name of the Snowflake pipe"
  value       = snowflake_pipe.pipe.fully_qualified_name
}