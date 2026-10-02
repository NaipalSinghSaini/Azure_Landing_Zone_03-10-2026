data "azurerm_public_ip" "pip-data-b" {
  for_each            = var.lb
  name                = each.value.lb_pip_name
  resource_group_name = each.value.resource_group_name
}