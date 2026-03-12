output "acr_id" {
  description = "ACR 리소스 ID"
  value       = azurerm_container_registry.acr.id
}

output "acr_login_server" {
  description = "ACR 로그인 서버 주소"
  value       = azurerm_container_registry.acr.login_server
}
