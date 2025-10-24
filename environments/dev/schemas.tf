# スキーマリソース
resource "snowflake_schema" "schema" {
  database = snowflake_database.primary.name
  name     = "TF_FIRST_SCHEMA"
}

resource "snowflake_schema" "schema2" {
  database = snowflake_database.primary.name
  name     = "TF_SECOND_SCHEMA"
}

resource "snowflake_schema" "schema3" {
  database = snowflake_database.primary.name
  name     = "TF_THIRD_SCHEMA"
}
