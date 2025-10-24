# プロバイダー設定
provider "snowflake" {
  organization_name = var.snowflake_organization_name
  account_name      = var.snowflake_account_name
  user              = var.snowflake_user
  token             = var.snowflake_password
  role              = var.snowflake_role
  authenticator     = "PROGRAMMATIC_ACCESS_TOKEN"
  
  # プレビュー機能を有効化
  preview_features_enabled = ["snowflake_table_resource"]
}
