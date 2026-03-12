output "communication_service_id" {
  description = "The ID of the Communication Service"
  value       = azurerm_communication_service.this.id
}

output "communication_service_name" {
  description = "The name of the Communication Service"
  value       = azurerm_communication_service.this.name
}

output "primary_connection_string" {
  description = "The primary connection string of the Communication Service"
  value       = azurerm_communication_service.this.primary_connection_string
  sensitive   = true
}

output "secondary_connection_string" {
  description = "The secondary connection string of the Communication Service"
  value       = azurerm_communication_service.this.secondary_connection_string
  sensitive   = true
}
