## Complete (with every optional set)
resource "snowflake_database" "primary" {
  name         = var.database_name
  is_transient = false
  comment      = "my standard database"
}
