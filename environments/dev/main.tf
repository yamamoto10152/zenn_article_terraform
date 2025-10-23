# Dev環境のメイン設定
terraform {
  required_version = ">= 1.0"
  required_providers {
    snowflake = {
      source  = "snowflakedb/snowflake"
      version = "~> 2.0"
    }
  }
}

provider "snowflake" {
  organization_name = var.snowflake_organization_name
  account_name      = var.snowflake_account_name
  user              = var.snowflake_user
  token             = var.snowflake_password
  role              = var.snowflake_role
  authenticator     = "PROGRAMMATIC_ACCESS_TOKEN"
}

# データベースモジュール
module "dev_database" {
  source = "../../modules/database"
  
  database_name = "YAMAMOTO_TF_FIRST_DATABASE"
}

# スキーマモジュール
module "dev_schema" {
  source = "github.com/getindata/terraform-snowflake-schema"

  name     = "YAMAMOTO_TF_FIRST_SCHEMA"
  database = module.dev_database.database_name

  is_managed          = false
  is_transient        = false
  data_retention_days = 1

  create_default_database_roles = false

  providers = {
    snowflake = snowflake
  }
}

# ウェアハウスモジュール
module "warehouse" {
  source = "../../modules/warehouse"
  
  warehouse_name = "YAMAMOTO_TF_FIRST_WAREHOUSE"
  warehouse_size = var.warehouse_size
  auto_suspend = var.auto_suspend
  auto_resume = var.auto_resume
  warehouse_type = var.warehouse_type
}
