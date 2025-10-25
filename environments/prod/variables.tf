# Prod環境の変数定義
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
  default     = "YAMAMOTO_TERRAFORM_SVC"
}

variable "snowflake_password" {
  description = "Snowflake password"
  type        = string
  sensitive   = true
}

variable "snowflake_role" {
  description = "Snowflake role"
  type        = string
  default     = "SYSADMIN"
}

variable "warehouse_size" {
  description = "Size of the Snowflake warehouse"
  type        = string
  default     = "SMALL"
}

variable "auto_suspend" {
  description = "Auto suspend time in minutes"
  type        = number
  default     = 60
}

variable "auto_resume" {
  description = "Auto resume setting"
  type        = bool
  default     = true
}

variable "warehouse_type" {
  description = "Warehouse type"
  type        = string
  default     = "STANDARD"
}

