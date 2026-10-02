resource "azurerm_mssql_server" "server-b" {
  for_each                     = var.sql
  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  version                      = each.value.version
    administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password

  tags = {
    environment = "production"
  }
}

resource "azurerm_mssql_database" "database-b" {
  for_each = var.sql
  name     = each.value.dbname
server_id = azurerm_mssql_server.server-b[each.key].id

  tags = {
    environment = "production"
  }
}