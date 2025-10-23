# Snowflakeウェアハウスモジュール
resource "snowflake_warehouse" "main" {
  name                         = "${upper(var.environment)}_WAREHOUSE"
  warehouse_size               = var.warehouse_size
  auto_suspend                 = var.auto_suspend
  auto_resume                  = var.auto_resume
  initially_suspended          = var.initially_suspended
  comment                      = "Warehouse for ${var.environment} environment"
  warehouse_type               = var.warehouse_type
  max_cluster_count            = var.max_cluster_count
  min_cluster_count            = var.min_cluster_count
  scaling_policy               = var.scaling_policy
  statement_timeout_in_seconds = var.statement_timeout_in_seconds
}

resource "snowflake_role" "warehouse_role" {
  name    = "${upper(var.environment)}_WAREHOUSE_ROLE"
  comment = "Role for ${var.environment} warehouse access"
}

resource "snowflake_user" "warehouse_user" {
  name                = "${var.environment}_warehouse_user"
  login_name          = "${var.environment}_warehouse_user"
  display_name        = "${title(var.environment)} Warehouse User"
  first_name          = var.first_name
  last_name           = var.last_name
  email               = var.email
  password            = var.user_password
  default_warehouse   = snowflake_warehouse.main.name
  default_role        = snowflake_role.warehouse_role.name
  must_change_password = var.must_change_password
  disabled            = var.disabled
}

resource "snowflake_role_grants" "warehouse_role_grants" {
  role_name = snowflake_role.warehouse_role.name
  users     = [snowflake_user.warehouse_user.name]
}

resource "snowflake_warehouse_grant" "warehouse_usage" {
  warehouse_name = snowflake_warehouse.main.name
  privilege      = "USAGE"
  roles          = [snowflake_role.warehouse_role.name]
}

resource "snowflake_warehouse_grant" "warehouse_operate" {
  warehouse_name = snowflake_warehouse.main.name
  privilege      = "OPERATE"
  roles          = [snowflake_role.warehouse_role.name]
}

resource "snowflake_warehouse_grant" "warehouse_modify" {
  warehouse_name = snowflake_warehouse.main.name
  privilege      = "MODIFY"
  roles          = [snowflake_role.warehouse_role.name]
}
