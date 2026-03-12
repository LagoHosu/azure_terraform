variable "name" {
  description = "The name of the AI Foundry service"
  type        = string
}

variable "location" {
  description = "The Azure region where the AI Foundry is deployed"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the AI Foundry service is created"
  type        = string
}

variable "ai_foundry_custom_subdomain_name" {
  description = "The custom subdomain name for the AI Foundry service"
  type        = string
}

variable "ai_foundry_public_network_access" {
  description = "Enables or disables public network access for the AI Foundry service"
  type        = string
  default     = "Disabled"
}

variable "sku_name" {
  description = "The SKU of the AI Foundry service (e.g., S0)"
  type        = string
  default     = "S0"
}

variable "ai_foundry_identity_type" {
  description = "The identity type for the AI Foundry service (e.g., SystemAssigned)"
  type        = string
  default     = "SystemAssigned"
}

variable "network_acls_bypass" {
  description = "Defines what traffic should bypass the network ACLs (empty string means no traffic bypass)"
  type        = string
  default     = "None" 
}

variable "network_acls_default_action" {
  description = "Defines the default action for network ACLs"
  type        = string
  default     = "Allow"
}

variable "local_authentication_disabled" {
  type    = bool
  default = false
}

variable "associated_projects" {
  description = "List of associated project names for the AI Foundry service"
  type        = list(string)
  default     = ["proj-default"]
}

variable "allowProjectManagement" {
  description = "Indicates whether project management is allowed for the AI Foundry service"
  type        = bool
  default     = true
}

variable "ai_foundry_type" {
  description = "The type of the AI Foundry service"
  type        = string
  # default     = "Microsoft.CognitiveServices/accounts@2025-04-01-preview"
}

variable "user_owned_storage_id" {
  description = "The resource ID of the storage account to associate with AI Foundry as user-owned storage"
  type        = string
}