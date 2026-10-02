data "azurerm_subnet" "subnet-data-b" {
  for_each             = var.appgw
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_public_ip" "pip-data-b" {
  for_each            = var.appgw
  name                = each.value.PIP_name
  resource_group_name = each.value.resource_group_name
}