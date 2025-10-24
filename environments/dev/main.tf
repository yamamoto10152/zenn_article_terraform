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
    key            = "snowflake-state/dev/zennarticle.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "yamamoto-terraform-state-lock-table-dev"
    encrypt        = true
  }  
}