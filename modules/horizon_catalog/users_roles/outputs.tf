# Outputs
output "child_role_name" {
  description = "Role name"
  value       = snowflake_account_role.role.fully_qualified_name
}

output "parent_role_name" {
  description = "Parent role name"
  value       = snowflake_account_role.parent_role.fully_qualified_name
}

output "user_name" {
  description = "User name"
  value       = snowflake_user.user.fully_qualified_name
}

output "service_user_name" {
  description = "Service user name"
  value       = snowflake_service_user.service_user.fully_qualified_name
}