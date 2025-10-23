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
  password          = var.snowflake_password
  role              = var.snowflake_role
  authenticator     = "PROGRAMMATIC_ACCESS_TOKEN"
}

# データベースモジュール
module "database" {
  source = "../../modules/database"
  
  environment = "dev"
  warehouse_size = var.warehouse_size
  auto_suspend = var.auto_suspend
  auto_resume = var.auto_resume
  warehouse_type = var.warehouse_type
  user_password = var.snowflake_password
}

# ウェアハウスモジュール
module "warehouse" {
  source = "../../modules/warehouse"
  
  environment = "dev"
  warehouse_size = var.warehouse_size
  auto_suspend = var.auto_suspend
  auto_resume = var.auto_resume
  warehouse_type = var.warehouse_type
  user_password = var.snowflake_password
}
