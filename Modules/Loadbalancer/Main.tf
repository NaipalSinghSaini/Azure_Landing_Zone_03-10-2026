resource "azurerm_lb" "lb-b" {
  for_each            = var.lb
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = each.value.sku

  frontend_ip_configuration {
    name                 = "frontend-ip"
    public_ip_address_id = data.azurerm_public_ip.pip-data-b[each.key].id
  }
}

# Backend Pool
resource "azurerm_lb_backend_address_pool" "backend-pool-b" {
  for_each        = var.lb
  name            = each.value.name
  loadbalancer_id = azurerm_lb.lb-b[each.key].id
}