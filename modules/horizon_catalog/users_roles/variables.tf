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