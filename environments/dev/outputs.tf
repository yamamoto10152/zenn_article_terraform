# 出力値定義
output "database_name" {
  description = "Name of the Snowflake database"
  value       = snowflake_database.primary.name
}

output "schema_names" {
  description = "Names of the Snowflake schemas"
  value = [
    snowflake_schema.schema.name,
    snowflake_schema.schema2.name,
    snowflake_schema.schema3.name
  ]
}

output "table_name" {
  description = "Name of the Snowflake table"
  value       = snowflake_table.table.name
}
