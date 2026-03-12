
variable "location" {
  description = "The Azure region where the AI Foundry is deployed"
  type        = string
}

variable "communication_service_name" {
  description = "The name of the Communication Service"
  type        = string
}

variable "data_location" {
  description = "The data location for the Communication Service"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the resource"
  type        = map(string)
  default     = {}
}
