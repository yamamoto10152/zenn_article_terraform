# Snowflakeデータベースモジュールの出力
output "database_name" {
  description = "Name of the Snowflake database"
  value       = snowflake_database.main.name
}

output "schema_name" {
  description = "Name of the Snowflake schema"
  value       = snowflake_schema.main.name
}

output "warehouse_name" {
  description = "Name of the Snowflake warehouse"
  value       = snowflake_warehouse.main.name
}

output "warehouse_size" {
  description = "Size of the Snowflake warehouse"
  value       = snowflake_warehouse.main.warehouse_size
}

output "role_name" {
  description = "Name of the Snowflake role"
  value       = snowflake_role.database_role.name
}

output "user_name" {
  description = "Name of the Snowflake user"
  value       = snowflake_user.main.name
}

output "user_login_name" {
  description = "Login name of the Snowflake user"
  value       = snowflake_user.main.login_name
}

output "connection_string" {
  description = "Snowflake connection string"
  value       = "${var.environment}.snowflakecomputing.com"
  sensitive   = true
}
