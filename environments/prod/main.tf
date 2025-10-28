# Prod
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

# データベース
resource "snowflake_database" "primary" {
  name = "YAMAMOTO_TF_PROD_DATABASE"
}

# スキーマ
resource "snowflake_schema" "schema" {
  database = snowflake_database.primary.name
  name     = "YAMAMOTO_TF_PROD_SCHEMA"
}
