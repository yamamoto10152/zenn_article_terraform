# Dev Variables
variable "snowflake_organization_name" {
  description = "Snowflake organization name"
  type        = string
}

variable "snowflake_account_name" {
  description = "Snowflake account name"
  type        = string
}

variable "snowflake_user" {
  description = "Snowflake username"
  type        = string
}

variable "snowflake_password" {
  description = "Snowflake password"
  type        = string
  sensitive   = true
}

variable "snowflake_role" {
  description = "Snowflake role"
  type        = string
}

variable "warehouse_size" {
  description = "Size of the Snowflake warehouse"
  type        = string
}

variable "auto_suspend" {
  description = "Auto suspend time in minutes"
  type        = number
}

variable "auto_resume" {
  description = "Auto resume setting"
  type        = bool
}

variable "warehouse_type" {
  description = "Warehouse type"
  type        = string
}
