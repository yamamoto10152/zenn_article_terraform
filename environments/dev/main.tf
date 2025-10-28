# Terraform Configuration
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

module "yamamoto_terraform_db" {
  source = "../../modules/horizon_catalog/yamamoto_terraform_db"
  
  providers = {
    snowflake.administrator = snowflake.administrator
  }
}

module "users_roles" {
  source = "../../modules/horizon_catalog/users_roles"
  default_password = var.default_password
  providers = {
    snowflake.useradmin = snowflake.useradmin
  }
}