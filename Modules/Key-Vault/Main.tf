resource "azurerm_key_vault" "kv-b" {
  for_each = var.kv

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name  = "standard"

  rbac_authorization_enabled = false

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
      "Purge"
    ]
  }
}

resource "azurerm_key_vault_secret" "vm_username" {

  for_each = var.kv

  name         = each.value.vm_username_secret
  value        = var.vm_admin_username
  key_vault_id = azurerm_key_vault.kv-b[each.key].id
}
resource "azurerm_key_vault_secret" "vm_password" {

  for_each = var.kv

  name         = each.value.vm_password_secret
  value        = var.vm_admin_password
  key_vault_id = azurerm_key_vault.kv-b[each.key].id
}
resource "azurerm_key_vault_secret" "sql_username" {

  for_each = var.kv

  name         = each.value.sql_username_secret
  value        = var.sql_admin_username
  key_vault_id = azurerm_key_vault.kv-b[each.key].id
}
resource "azurerm_key_vault_secret" "sql_password" {

  for_each = var.kv

  name         = each.value.sql_password_secret
  value        = var.sql_admin_password
  key_vault_id = azurerm_key_vault.kv-b[each.key].id
}