# Role Resource
resource "snowflake_account_role" "role" {
  name = "YAMAMOTO_CHILD_ROLE"
}

resource "snowflake_account_role" "parent_role" {
  name = "YAMAMOTO_PARENT_ROLE"
}

resource "snowflake_grant_account_role" "g1" {
  role_name        = snowflake_account_role.role.name
  parent_role_name = snowflake_account_role.parent_role.name
}

resource "snowflake_grant_account_role" "g2" {
  role_name = snowflake_account_role.role.name
  user_name = snowflake_user.user.name
}