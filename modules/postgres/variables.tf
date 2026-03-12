variable "postgres_name" {
  type        = string
  description = "PostgreSQL 서버 이름"
}

variable "resource_group_name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "admin_username" {
  type        = string
  default     = null
}

variable "admin_password" {
  type        = string
  sensitive   = true
  default     = null
}

variable "postgres_version" {
  type        = string
  default     = "14"
}

variable "postgres_zone" {
  type        = string
  default     = "3"
}

variable "storage_mb" {
  type        = number
  default     = 32768
}

variable "sku_name" {
  type        = string
  default     = "Standard_D2s_v3"
}

variable "active_directory_auth_enabled" {
  type        = bool
  default     = true
}

variable "password_auth_enabled" {
  type        = bool
  default     = true
}

variable "tenant_id" {
  type        = string
  description = "Azure AD Tenant ID for PostgreSQL authentication"
}
