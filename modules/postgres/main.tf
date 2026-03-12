resource "azurerm_postgresql_flexible_server" "postgres" {
  name                   = var.postgres_name
  resource_group_name    = var.resource_group_name
  location               = var.location

  # administrator_login    = var.admin_username
  # administrator_password = var.admin_password

  version                = var.postgres_version
  zone                   = var.postgres_zone
  storage_mb             = var.storage_mb
  sku_name               = var.sku_name

  authentication {
    active_directory_auth_enabled = var.active_directory_auth_enabled
    password_auth_enabled         = var.password_auth_enabled
    tenant_id                     = var.tenant_id
  }

  auto_grow_enabled            = true
  geo_redundant_backup_enabled = true
}
