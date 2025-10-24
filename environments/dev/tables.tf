# テーブルリソース
resource "snowflake_table" "table" {
  database                    = snowflake_schema.schema.database
  schema                      = snowflake_schema.schema.name
  name                        = "TF_TB_A"
  comment                     = "A table."
  cluster_by                  = ["to_date(DATE)"]
  change_tracking             = false

  column {
    name     = "id"
    type     = "int"
    nullable = true
  }

  column {
    name     = "identity"
    type     = "NUMBER(38,0)"
    nullable = true

    identity {
      start_num = 1
      step_num  = 3
    }
  }

  column {
    name     = "data"
    type     = "text"
    nullable = false
    collate  = "en-ci"
  }

  column {
    name = "DATE"
    type = "TIMESTAMP_NTZ(9)"
  }

  column {
    name    = "extra"
    type    = "VARIANT"
    comment = "extra data"
  }
}
