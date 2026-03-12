variable "name" {
  description = "Storage account name"
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

variable "account_tier" {
  description = "Storage account tier"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Replication type"
  type        = string
  default     = "RAGZRS"
}

variable "allow_nested_items_to_be_public" {
  description = "Allow nested items to be public"
  type        = bool
  default     = false
}

variable "default_to_oauth_authentication" {
  description = "Default to Azure AD authentication"
  type        = bool
  default     = true
}

variable "is_hns_enabled" {
  description = "Enable hierarchical namespace (Data Lake)"
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "Enable public network access"
  type        = bool
  default     = false
}

variable "is_local_user_enabled" {
  description = "Enable local user authentication"
  type        = bool
  default     = false
  
}

variable "acls_default_action" {
  description = "Defines the default action for network ACLs"
  type        = string
  default     = "Allow"
}

variable "large_file_share_enabled" {
  description = "Enable large file shares (100TiB)"
  type        = bool
  default     = false  
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
