# Snowflakeウェアハウスモジュール
resource "snowflake_warehouse" "main" {
  name                         = var.warehouse_name
  warehouse_size               = var.warehouse_size
  auto_suspend                 = var.auto_suspend
  auto_resume                  = var.auto_resume
  initially_suspended          = var.initially_suspended
  comment                      = "Warehouse for Terraform"
  warehouse_type               = var.warehouse_type
  max_cluster_count            = var.max_cluster_count
  min_cluster_count            = var.min_cluster_count
  scaling_policy               = var.scaling_policy
  statement_timeout_in_seconds = var.statement_timeout_in_seconds
}
