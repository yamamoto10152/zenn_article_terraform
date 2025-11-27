# Provider Configuration
provider "snowflake" {
  organization_name = var.snowflake_organization_name
  account_name      = var.snowflake_account_name
  user              = "TERRAFORM"
  token             = var.snowflake_password
  role              = "SYSADMIN"
  authenticator     = "PROGRAMMATIC_ACCESS_TOKEN"
  
  # プレビュー機能を有効化
  preview_features_enabled = [
    "snowflake_table_resource",
    "snowflake_api_integration_resource",
    "snowflake_storage_integration_resource",
    "snowflake_stage_resource",
    "snowflake_pipe_resource"
  ]
}

provider "snowflake" {
  alias             = "accountadmin"
  organization_name = var.snowflake_organization_name
  account_name      = var.snowflake_account_name
  user              = "TERRAFORM"
  token             = var.snowflake_password
  role              = "ACCOUNTADMIN"
  authenticator     = "PROGRAMMATIC_ACCESS_TOKEN"
}

provider "snowflake" {
  alias             = "useradmin"
  organization_name = var.snowflake_organization_name
  account_name      = var.snowflake_account_name
  user              = "TERRAFORM"
  token             = var.snowflake_password
  role              = "USERADMIN"
  authenticator     = "PROGRAMMATIC_ACCESS_TOKEN"
}