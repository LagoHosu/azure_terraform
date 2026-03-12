output "cosmosdb_account_id" {
  description = "Cosmos DB account ID"
  value       = azurerm_cosmosdb_account.this.id
}

output "cosmosdb_account_name" {
  description = "Cosmos DB account name"
  value       = azurerm_cosmosdb_account.this.name
}

output "cosmosdb_account_endpoint" {
  description = "Cosmos DB account endpoint"
  value       = azurerm_cosmosdb_account.this.endpoint
}
