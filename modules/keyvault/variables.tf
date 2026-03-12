variable "name" {
  description = "The name of the Key Vault"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "public_network_access_enabled" {
  description = "Enable or disable public network access to the Key Vault"
  type        = bool
  default     = false
}

variable "sku_name" {
  description = "The SKU name of the Key Vault (e.g., standard)"
  type        = string
  default     = "standard"
}

variable "tenant_id" {
  description = "The Azure AD tenant ID associated with the Key Vault"
  type        = string
}

variable "rbac_authorization_enabled" {
  description = "Enable or disable RBAC authorization for the Key Vault"
  type        = bool
  default     = true
}

variable "soft_delete_retention_days" {
  description = "The number of days to retain deleted Key Vaults (soft delete)"
  type        = number
  default     = 90
  
}