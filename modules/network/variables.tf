# provider 참고용(terraform/main.tf 실행시 삭제)
variable "subscription_id" {
  type = string
}


variable "resource_group_name" {
  description = "리소스 그룹 이름"
  type        = string
}

variable "location" {
  description = "리소스 위치"
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network 이름"
  type        = string
}

variable "vnet_address_space" {
  description = "VNet 주소 범위"
  type        = list(string)
  default     = ["10.240.0.0/16"]
}

variable "default_subnet_space" {
  description = "VNet 주소 범위"
  type        = list(string)
  default     = ["10.200.0.0/18"]
}

variable "default_subnet_name" {
  description = "기본 서브넷 이름"
  type        = string
  default     = "default"
}



# variable "postgresql_id" {
#   description = "PostgreSQL 리소스 ID"
#   type        = string
# }

# variable "storage_account_id" {
#   description = "Storage Account 리소스 ID"
#   type        = string
# }

# variable "cosmosdb_id" {
#   description = "CosmosDB 리소스 ID"
#   type        = string
# }

# variable "keyvault_id" {
#   description = "KeyVault 리소스 ID"
#   type        = string
# }
