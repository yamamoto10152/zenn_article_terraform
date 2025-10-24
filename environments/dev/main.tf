# Dev環境のメイン設定
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
    key            = "snowflake-state/snowflake.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "yamamoto-terraform-state-lock-table"
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
# module "primary" {
#   source = "../../modules/database"
  
#   database_name = "YAMAMOTO_TF_FIRST_DATABASE"
# }
resource "snowflake_database" "primary" {
  name = "YAMAMOTO_TF_FIRST_DATABASE"
}

# スキーマ
resource "snowflake_schema" "schema" {
  # database            = module.primary.database_name
  database            = snowflake_database.primary.name
  name                = "YAMAMOTO_TF_FIRST_SCHEMA"
}
# resource "snowflake_schema" "schema2" {
#   # database            = module.primary.database_name
#   database            = snowflake_database.primary.name
#   name                = "YAMAMOTO_TF_SECOND_SCHEMA"
# }
resource "snowflake_schema" "schema3" {
  # database            = module.primary.database_name
  database            = snowflake_database.primary.name
  name                = "YAMAMOTO_TF_THIRD_SCHEMA"
}

# テーブル
resource "snowflake_table" "table" {
  database                    = snowflake_schema.schema.database
  schema                      = snowflake_schema.schema.name
  name                        = "TF_TB_F"
  comment                     = "A table."
  cluster_by                  = ["to_date(DATE)"]
  change_tracking             = false

  column {
    name     = "id"
    type     = "int"
    nullable = true
  }

  column {
    name     = "identity"
    type     = "NUMBER(38,0)"
    nullable = true

    identity {
      start_num = 1
      step_num  = 3
    }
  }

  column {
    name     = "data"
    type     = "text"
    nullable = false
    collate  = "en-ci"
  }

  column {
    name = "DATE"
    type = "TIMESTAMP_NTZ(9)"
  }

  column {
    name    = "extra"
    type    = "VARIANT"
    comment = "extra data"
  }

}

# ウェアハウスモジュール
# module "warehouse" {
#   source = "../../modules/warehouse"
  
#   warehouse_name = "YAMAMOTO_TF_FIRST_WAREHOUSE"
#   warehouse_size = var.warehouse_size
#   auto_suspend = var.auto_suspend
#   auto_resume = var.auto_resume
#   warehouse_type = var.warehouse_type
# }
