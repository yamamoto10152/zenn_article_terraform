# User Resource
resource "snowflake_user" "user" {
  name                  = "user001"
  login_name            = var.system_name
  display_name          = var.system_name
  comment               = "Controlled by Terraform"
  first_name            = var.first_name
  last_name             = var.last_name
  password              = var.password
  disabled              = "false"
  email                 = var.email
  default_warehouse     = snowflake_warehouse.warehouse.name
  default_role          = snowflake_role.role.name
  must_change_password  = "true"
  disable_mfa           = "false"
}

variable "system_name" {
  type      = string
  sensitive = true
  default   = "YAMAMOTO_TERRAFORM_USER"
}

variable "email" {
  type      = string
  sensitive = true
}

variable "password" {
  type      = string
  sensitive = true
}

variable "first_name" {
  type      = string
  sensitive = true
}

variable "last_name" {
  type      = string
  sensitive = true
}



# with all attributes set
resource "snowflake_service_user" "service_user" {
  name              = "Terraform Service User"
  login_name        = var.login_name
  display_name      = var.login_name
  comment           = "Controlled by Terraform"
  disabled          = "false"
  default_warehouse = snowflake_warehouse.warehouse.name
  default_role      = snowflake_role.role.name
  rsa_public_key    = var.rsa_public_key
  rsa_public_key_2  = var.rsa_public_key_2
}


variable "rsa_public_key" {
  type      = string
  sensitive = true
}

variable "rsa_public_key_2" {
  type      = string
  sensitive = true
}

variable "login_name" {
  type      = string
  sensitive = true
}