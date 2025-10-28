# Outputs
output "child_role_name" {
  description = "Role name"
  value       = snowflake_account_role.role.name
}

output "parent_role_name" {
  description = "Parent role name"
  value       = snowflake_account_role.parent_role.name
}

output "user_name" {
  description = "User name"
  value       = snowflake_user.user.name
}

output "service_user_name" {
  description = "Service user name"
  value       = snowflake_service_user.service_user.name
}