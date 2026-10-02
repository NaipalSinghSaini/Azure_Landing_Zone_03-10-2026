variable "sql" {}
variable "administrator_login" {
  type      = string
  sensitive = true
}

variable "administrator_login_password" {
  type      = string
  sensitive = true
}