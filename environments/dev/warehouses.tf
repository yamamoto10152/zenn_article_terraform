# Warehouse Resource
resource "snowflake_warehouse" "warehouse" {
  name              = "YAMAMOTO_TERRAFORM_WAREHOUSE"
  comment           = "Controlled by Terraform"
  warehouse_type    = "STANDARD"
  generation        = "2"
  warehouse_size    = "XSMALL"
  auto_resume       = false
  auto_suspend      = 1200
  min_cluster_count = 2
  max_cluster_count = 4
  scaling_policy    = "ECONOMY"
}