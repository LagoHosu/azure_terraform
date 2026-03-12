variable "servicebus_name" {
  description = "The name of the Service Bus Namespace"
  type        = string
}

variable "location" {
  description = "The Azure region where the Service Bus will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Service Bus Namespace will be created"
  type        = string
}

variable "servicebus_sku" {
  description = "The SKU of the Service Bus"
  type        = string
  default     = "Standard"
}

variable "local_auth_enabled" {
  description = "Specifies whether local authentication is enabled"
  type        = bool
  default     = false
}
