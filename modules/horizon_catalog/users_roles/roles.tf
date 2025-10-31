# Role Resource
resource "snowflake_account_role" "role" {
  provider = snowflake.useradmin
  name = "YAMAMOTO_CHILD_ROLE"
}

resource "snowflake_account_role" "parent_role" {
  provider = snowflake.useradmin
  name = "YAMAMOTO_PARENT_ROLE"
}

resource "snowflake_grant_account_role" "g1" {
  provider = snowflake.useradmin
  role_name        = snowflake_account_role.role.name
  parent_role_name = snowflake_account_role.parent_role.name
}

resource "snowflake_grant_account_role" "g2" {
  provider = snowflake.useradmin
  role_name = snowflake_account_role.role.name
  user_name = snowflake_user.user.name
}

# S3 Role and Grants
resource "snowflake_account_role" "s3_role" {
  provider = snowflake.useradmin
  name     = "S3_ROLE"
}

resource "snowflake_database_grant" "s3_db_usage" {
  database_name = var.database_name
  privilege     = "USAGE"
  roles         = [snowflake_account_role.s3_role.name]
}

resource "snowflake_schema_grant" "s3_schema_usage" {
  database_name = var.database_name
  schema_name   = var.schema_name
  privilege     = "USAGE"
  roles         = [snowflake_account_role.s3_role.name]
}

resource "snowflake_table_grant" "s3_table_privs" {
  database_name = var.database_name
  schema_name   = var.schema_name
  on_all        = false
  table_name    = var.table_name
  privileges    = ["INSERT", "SELECT"]
  roles         = [snowflake_account_role.s3_role.name]
}

resource "snowflake_stage_grant" "s3_stage_usage" {
  database_name = var.database_name
  schema_name   = var.schema_name
  stage_name    = var.stage_name
  privilege     = "USAGE"
  roles         = [snowflake_account_role.s3_role.name]
}

# Ownership transfer on pipe (if supported by provider);
# If not supported, this block may need to be managed manually.
resource "snowflake_pipe_grant" "s3_pipe_ownership" {
  database_name = var.database_name
  schema_name   = var.schema_name
  pipe_name     = var.pipe_name
  privilege     = "OWNERSHIP"
  roles         = [snowflake_account_role.s3_role.name]
}

resource "snowflake_grant_account_role" "grant_s3_role_to_user" {
  provider  = snowflake.useradmin
  role_name = snowflake_account_role.s3_role.name
  user_name = var.main_user_name
}