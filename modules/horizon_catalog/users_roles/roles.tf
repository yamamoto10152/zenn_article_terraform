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