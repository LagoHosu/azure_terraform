output "servicebus_namespace_id" {
  description = "The ID of the Service Bus Namespace"
  value       = azurerm_servicebus_namespace.this.id
}

output "servicebus_namespace_name" {
  description = "The name of the Service Bus Namespace"
  value       = azurerm_servicebus_namespace.this.name
}
