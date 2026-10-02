data "azurerm_subnet" "subnet-data-b" {
  for_each             = var.nic
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_network_security_group" "nsg-data-b" {
  for_each            = var.nic
  name                = each.value.nsg_name
  resource_group_name = each.value.resource_group_name
}