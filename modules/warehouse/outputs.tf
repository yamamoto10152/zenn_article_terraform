# Snowflakeウェアハウスモジュールの出力
output "warehouse_name" {
  description = "Name of the Snowflake warehouse"
  value       = snowflake_warehouse.main.name
}

output "warehouse_size" {
  description = "Size of the Snowflake warehouse"
  value       = snowflake_warehouse.main.warehouse_size
}

output "warehouse_type" {
  description = "Type of the Snowflake warehouse"
  value       = snowflake_warehouse.main.warehouse_type
}

output "auto_suspend" {
  description = "Auto suspend time in minutes"
  value       = snowflake_warehouse.main.auto_suspend
}

output "auto_resume" {
  description = "Auto resume setting"
  value       = snowflake_warehouse.main.auto_resume
}
