variable "rg" {}
variable "vnet" {}
variable "subnet" {}
variable "nsg" {}
variable "pip" {}
variable "nic" {}
variable "vm" {}
variable "lb" {}
variable "kv" {}
variable "bastion" {}
variable "appgw" {}
variable "sql" {}

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