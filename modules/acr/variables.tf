variable "acr_name" {
  description = "Container Registry 이름"
  type        = string
}

variable "resource_group_name" {
  description = "ACR이 속할 리소스 그룹"
  type        = string
}

variable "location" {
  description = "리소스 위치"
  type        = string
}

variable "sku" {
  description = "ACR SKU"
  type        = string
  default     = "Standard"
}

variable "admin_enabled" {
  description = "Admin 계정 활성화 여부"
  type        = bool
  default     = true
}
