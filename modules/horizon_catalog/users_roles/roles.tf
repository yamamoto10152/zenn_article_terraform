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
resource "snowflake_database_role" "s3_role" {
  name     = "S3_STAGE_ROLE"
  comment  = "For yamamoto10152"
  database = var.database_name
}

resource "snowflake_grant_privileges_to_database_role" "s3_db_usage" {
  privileges         = ["USAGE"]
  database_role_name = snowflake_database_role.s3_role.fully_qualified_name
  on_database        = snowflake_database_role.s3_role.database
  on_schema {
    schema_name = var.schema_name
  }
  on_schema_object {
    object_type = "STAGE"
    object_name = var.stage_name.fully_qualified_name
  }
}

resource "snowflake_grant_privileges_to_database_role" "s3_table_privs" {
  privileges         = ["SELECT", "INSERT"]
  database_role_name = snowflake_database_role.s3_role.fully_qualified_name
  on_schema_object {
    all {
      object_type_plural = "TABLES"
      in_schema          = var.schema_name.fully_qualified_name
    }
  }
}

# resource "snowflake_grant_privileges_to_database_role" "s3_stage_usage" {
#   privileges         = ["USAGE"]
#   database_role_name = snowflake_database_role.s3_role.fully_qualified_name
#   on_schema_object {
#     object_type = "STAGE"
#     object_name = var.stage_name.fully_qualified_name
#   }
# }



# Ownership transfer on pipe (if supported by provider);
# If not supported, this block may need to be managed manually.
# resource "snowflake_pipe_grant" "s3_pipe_ownership" {
#   database_name = var.database_name
#   schema_name   = var.schema_name
#   pipe_name     = var.pipe_name
#   privilege     = "OWNERSHIP"
#   roles         = [snowflake_account_role.s3_role.name]
# }

# resource "snowflake_grant_account_role" "grant_s3_role_to_user" {
#   provider  = snowflake.useradmin
#   role_name = snowflake_account_role.s3_role.name
#   user_name = var.main_user_name
# }