# Snowflakeデータベースモジュールの出力
output "database_name" {
  description = "Name of the Snowflake database"
  value       = snowflake_database.main.name
}
