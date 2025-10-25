# Prod環境のメイン設定
terraform {
  required_version = ">= 1.0"
  required_providers {
    snowflake = {
      source  = "snowflakedb/snowflake"
      version = "~> 2.0"
    }
  }
  backend "s3" {
    bucket         = "yamamoto-terraform-state-bucket"
    key            = "snowflake-state/prod/zennarticle.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "yamamoto-terraform-state-lock-table-prod"
    encrypt        = true
  }
}

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

# データベース
resource "snowflake_database" "primary" {
  name = "YAMAMOTO_TF_PROD_DATABASE"
}

# スキーマ
resource "snowflake_schema" "schema" {
  database = snowflake_database.primary.name
  name     = "YAMAMOTO_TF_PROD_SCHEMA"
}
