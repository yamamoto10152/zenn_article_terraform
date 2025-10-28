# User Resource
resource "snowflake_user" "user" {
  provider              = snowflake.useradmin
  name                  = "user001"
  login_name            = var.user_login_name
  display_name          = var.user_login_name
  comment               = "Controlled by Terraform"
  first_name            = var.first_name
  last_name             = var.last_name
  password              = var.default_password
  disabled              = "false"
  email                 = var.email
  default_warehouse     = var.default_warehouse_name
  default_role          = "PUBLIC"
  must_change_password  = "true"
  disable_mfa           = "false"
}

resource "snowflake_service_user" "service_user" {
  provider          = snowflake.useradmin
  name              = "Terraform Service User"
  login_name        = var.service_name
  display_name      = var.service_name
  comment           = "Controlled by Terraform"
  disabled          = "false"
  default_warehouse = snowflake_warehouse.warehouse.name
  default_role      = "PUBLIC"
  # rsa_public_key    = var.rsa_public_key
  # rsa_public_key_2  = var.rsa_public_key_2
}
