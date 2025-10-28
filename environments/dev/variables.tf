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

variable "user_login_name" {
  type      = string
  sensitive = true
  default   = "YAMAMOTO_TERRAFORM_USER"
}

variable "email" {
  type      = string
  sensitive = true
  default   = "hoge@example.com"
}

variable "default_password" {
  type      = string
  sensitive = true
}

variable "first_name" {
  type      = string
  sensitive = true
  default   = "hoge"
}

variable "last_name" {
  type      = string
  sensitive = true
  default   = "hoge"
}

# variable "rsa_public_key" {
#   type      = string
#   sensitive = true
# }

# variable "rsa_public_key_2" {
#   type      = string
#   sensitive = true
# }

variable "service_name" {
  type      = string
  sensitive = true
  default   = "YAMAMOTO_SERVICE"
}