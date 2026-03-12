locals {
  # terraform.tfvars의 resource_name을 기반으로 변수 설정
  acr_name                         = "acr${var.resource_name}"
  aks_name                         = "aks-${var.resource_name}"
  postgres_name                    = "postgre-${var.resource_name}"
  storage_name                     = "files${var.resource_name}"
  cosmos_name                      = "mongo-${var.resource_name}"
  key_vault_name                   = "kv-${var.resource_name}"
  ai_foundry_name                  = "foundry-${var.resource_name}"
  ai_foundry_custom_subdomain_name = "foundry-${var.resource_name}"
  servicebus_name                  = "sb-${var.resource_name}"
  communication_service_name       = "cs-${var.resource_name}"
  vnet_name                        = "vnet-${var.resource_name}"
}

