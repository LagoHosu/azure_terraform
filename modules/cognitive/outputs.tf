output "ai_foundry_id" {
  description = "The ID of the AI Foundry service"
  value       = azapi_resource.ai_foundry.id
}

output "ai_foundry_name" {
  description = "The name of the AI Foundry service"
  value       = azapi_resource.ai_foundry.name
}

output "ai_foundry_subdomain" {
  description = "The custom subdomain of the AI Foundry service"
  value       = azapi_resource.ai_foundry.body["properties"]["customSubDomainName"]
}
