# Snowflakeデータベースモジュールの変数定義
variable "environment" {
  description = "Environment name (dev, prod)"
  type        = string
}

variable "warehouse_size" {
  description = "Size of the Snowflake warehouse"
  type        = string
  default     = "XSMALL"
  validation {
    condition = contains(["X-SMALL", "SMALL", "MEDIUM", "LARGE", "X-LARGE", "2X-LARGE", "3X-LARGE", "4X-LARGE"], var.warehouse_size)
    error_message = "Warehouse size must be one of: X-SMALL, SMALL, MEDIUM, LARGE, X-LARGE, 2X-LARGE, 3X-LARGE, 4X-LARGE."
  }
}

variable "auto_suspend" {
  description = "Number of minutes of inactivity before the warehouse automatically suspends"
  type        = number
  default     = 60
}

variable "auto_resume" {
  description = "Whether the warehouse is automatically resumed"
  type        = bool
  default     = true
}

variable "initially_suspended" {
  description = "Whether the warehouse is initially suspended"
  type        = bool
  default     = true
}

variable "warehouse_type" {
  description = "Type of warehouse (STANDARD or SNOWPARK-OPTIMIZED)"
  type        = string
  default     = "STANDARD"
  validation {
    condition = contains(["STANDARD", "SNOWPARK-OPTIMIZED"], var.warehouse_type)
    error_message = "Warehouse type must be either STANDARD or SNOWPARK-OPTIMIZED."
  }
}

variable "max_cluster_count" {
  description = "Maximum number of clusters for a multi-cluster warehouse"
  type        = number
  default     = 1
}

variable "min_cluster_count" {
  description = "Minimum number of clusters for a multi-cluster warehouse"
  type        = number
  default     = 1
}

variable "scaling_policy" {
  description = "Scaling policy for multi-cluster warehouse (STANDARD or ECONOMY)"
  type        = string
  default     = "STANDARD"
  validation {
    condition = contains(["STANDARD", "ECONOMY"], var.scaling_policy)
    error_message = "Scaling policy must be either STANDARD or ECONOMY."
  }
}

variable "statement_timeout_in_seconds" {
  description = "Statement timeout in seconds"
  type        = number
  default     = 3600
}

variable "user_password" {
  description = "Password for the Snowflake user"
  type        = string
  sensitive   = true
}

variable "must_change_password" {
  description = "Whether the user must change their password on next login"
  type        = bool
  default     = false
}

variable "disabled" {
  description = "Whether the user is disabled"
  type        = bool
  default     = false
}
