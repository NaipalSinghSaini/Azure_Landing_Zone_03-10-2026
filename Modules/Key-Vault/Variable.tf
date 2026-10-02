variable "kv" {}
  
variable "vm_username_secret" {
  type = string
}

variable "vm_password_secret" {
  type = string
}

variable "sql_username_secret" {
  type = string
}

variable "sql_password_secret" {
  type = string
}

variable "vm_admin_username" {
  type      = string
  sensitive = true
}

variable "vm_admin_password" {
  type      = string
  sensitive = true
}

variable "sql_admin_username" {
  type      = string
  sensitive = true
}

variable "sql_admin_password" {
  type      = string
  sensitive = true
}