variable "main_user_name" {
  type        = string
  description = "Default user name for grants"
}

# Users and Roles Variables
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

variable "service_name" {
  type      = string
  sensitive = true
  default   = "YAMAMOTO_SERVICE"
}

variable "default_warehouse_name" {
  type        = string
  description = "Name of the default warehouse for users"
}

variable "database_name" {
  type        = string
  description = "Target database name for grants"
}

variable "schema_name" {
  type        = fully_qualified_name
  description = "Target schema fully qualified name for grants"
}

variable "table_name" {
  type        = string
  description = "Target table name for grants"
}

variable "stage_name" {
  type        = fully_qualified_name
  description = "Target stage name for grants"
}

variable "pipe_name" {
  type        = string
  description = "Target pipe name for ownership grant"
}
