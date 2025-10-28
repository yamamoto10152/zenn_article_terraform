# Snowflakeデータベースモジュール
resource "snowflake_database" "main" {
  name    = "${upper(var.environment)}_DATABASE"
  comment = "Database for ${var.environment} environment"
}

resource "snowflake_schema" "main" {
  database = snowflake_database.main.name
  name     = "${upper(var.environment)}_SCHEMA"
  comment  = "Main schema for ${var.environment} environment"
}

resource "snowflake_role" "database_role" {
  name    = "${upper(var.environment)}_DATABASE_ROLE"
  comment = "Role for ${var.environment} database access"
}

resource "snowflake_user" "main" {
  name                = "${var.environment}_user"
  login_name          = "${var.environment}_user"
  display_name        = "${title(var.environment)} User"
  password            = var.user_password
  default_warehouse   = snowflake_warehouse.main.name
  default_role        = snowflake_role.database_role.name
  must_change_password = var.must_change_password
  disabled            = var.disabled
}

resource "snowflake_role_grants" "database_role_grants" {
  role_name = snowflake_role.database_role.name
  users     = [snowflake_user.main.name]
}

resource "snowflake_warehouse_grant" "warehouse_usage" {
  warehouse_name = snowflake_warehouse.main.name
  privilege      = "USAGE"
  roles          = [snowflake_role.database_role.name]
}

resource "snowflake_database_grant" "database_usage" {
  database_name = snowflake_database.main.name
  privilege     = "USAGE"
  roles         = [snowflake_role.database_role.name]
}

resource "snowflake_schema_grant" "schema_usage" {
  database_name = snowflake_database.main.name
  schema_name   = snowflake_schema.main.name
  privilege     = "USAGE"
  roles         = [snowflake_role.database_role.name]
}

resource "snowflake_schema_grant" "schema_create_table" {
  database_name = snowflake_database.main.name
  schema_name   = snowflake_schema.main.name
  privilege     = "CREATE TABLE"
  roles         = [snowflake_role.database_role.name]
}
