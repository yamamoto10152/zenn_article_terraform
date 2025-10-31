resource "snowflake_stage" "s3_stage" {
  name        = "YAMAMOTO_S3_STAGE"
  comment     = "For yamamoto10152"
  url         = "s3://${var.s3_bucket_name}/snowpipe/"
  database    = snowflake_database.primary.name
  schema      = snowflake_schema.schema.name
  storage_integration = var.s3_integration_name
}

resource "snowflake_pipe" "pipe" {
  name     = "YAMAMOTO_PIPE"
  comment = "For yamamoto10152"
  database = snowflake_database.primary.name
  schema   = snowflake_schema.schema.name
  auto_ingest    = true

  copy_statement = "copy into ${snowflake_table.table.fully_qualified_name} from @${snowflake_stage.s3_stage.fully_qualified_name}"
}

# resource "snowflake_pipe" "pipe_with_stage_change_trigger" {
#   database = snowflake_stage.stage.database
#   schema   = snowflake_stage.stage.schema
#   name     = "PIPE_WITH_STAGE_CHANGE_TRIGGER"

#   copy_statement = "copy into ${snowflake_table.table.fully_qualified_name} from @${snowflake_stage.stage.fully_qualified_name}"

#   lifecycle {
#     replace_triggered_by = [
#       snowflake_stage.stage.url,
#       snowflake_stage.stage.storage_integration,
#       snowflake_stage.stage.encryption,
#     ]
#   }
# }