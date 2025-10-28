# User Resource
resource "snowflake_user" "user" {
  name                  = "user001"
  login_name            = var.user_login_name
  display_name          = var.user_login_name
  comment               = "Controlled by Terraform"
  first_name            = var.first_name
  last_name             = var.last_name
  password              = var.password
  disabled              = "false"
  email                 = var.email
  default_warehouse     = snowflake_warehouse.warehouse.name
  default_role          = var.snowflake_role
  must_change_password  = "true"
  disable_mfa           = "false"
}

# with all attributes set
resource "snowflake_service_user" "service_user" {
  name              = "Terraform Service User"
  login_name        = var.login_name
  display_name      = var.login_name
  comment           = "Controlled by Terraform"
  disabled          = "false"
  default_warehouse = snowflake_warehouse.warehouse.name
  default_role      = var.snowflake_role
  # rsa_public_key    = var.rsa_public_key
  # rsa_public_key_2  = var.rsa_public_key_2
}
