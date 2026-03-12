output "postgres_id" {
  value = azurerm_postgresql_flexible_server.postgres.id
}

output "postgres_fqdn" {
  value = azurerm_postgresql_flexible_server.postgres.fqdn
}
