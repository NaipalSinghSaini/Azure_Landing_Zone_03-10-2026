module "rg" {
  source = "../../Modules/RG"
  rg     = var.rg
}
module "vnet" {
  depends_on = [module.rg]
  source     = "../../Modules/Vnet"
  vnet       = var.vnet
}
module "subnet" {
  depends_on = [module.vnet]
  source     = "../../Modules/Subnet"
  subnet     = var.subnet
}
module "nsg" {
  depends_on = [module.rg]
  source     = "../../Modules/NSG"
  nsg        = var.nsg
}
module "pip" {
  depends_on = [module.rg]
  source     = "../../Modules/PIP"
  pip        = var.pip
}
module "nic" {
  depends_on = [module.subnet, module.nsg, module.pip]
  source     = "../../Modules/NIC"
  nic        = var.nic
}
module "vm" {
  depends_on     = [module.nic, module.kv]
  source         = "../../Modules/Vm"
  vm             = var.vm
  nic_ids        = module.nic.nic_ids
  admin_username = module.kv.vm_admin_username
  admin_password = module.kv.vm_admin_password
}
module "lb" {
  depends_on = [module.nic]
  source     = "../../Modules/Loadbalancer"
  lb         = var.lb
}
module "kv" {
  depends_on          = [module.rg]
  source              = "../../Modules/Key-Vault"
  kv                  = var.kv
  vm_username_secret  = "vm-admin-username"
  vm_password_secret  = "vm-admin-password"
  sql_username_secret = "sql-admin-username"
  sql_password_secret = "sql-admin-password"

  vm_admin_username  = var.vm_admin_username
  vm_admin_password  = var.vm_admin_password
  sql_admin_username = var.sql_admin_username
  sql_admin_password = var.sql_admin_password
}
module "bastion" {
  depends_on = [module.subnet, module.pip]
  source     = "../../Modules/Bastion"
  bastion    = var.bastion
}
module "appgw" {
  depends_on = [module.subnet]
  source     = "../../Modules/Application-Gateway"
  appgw      = var.appgw
}
module "sql" {
  depends_on                   = [module.rg]
  source                       = "../../Modules/Sql-database"
  sql                          = var.sql
  administrator_login          = module.kv.sql_admin_username
  administrator_login_password = module.kv.sql_admin_password
}