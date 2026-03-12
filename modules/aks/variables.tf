variable "aks_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "available_zones" {
  description = "The list of availability zones for the AKS cluster"
  type        = list(string)
  default     = ["1", "3"]
  
}
variable "dns_prefix" {
  type = string
}

variable "subnet_id" {
  description = "AKS가 사용할 Subnet ID"
  type        = string
}

variable "admin_group_object_ids" {
  type = list(string)
}

variable "tenant_id" {
  type = string
}

# vnet info
variable "vnet_name" {
  description = "VNet 이름"
  type        = string
}

variable "vnet_address_space" {
  description = "VNet 주소 범위"
  type        = list(string)
}

# acr identity
variable "acr_id" {
  type = string
}

variable "workload_identity_enabled" {
  type = bool
  default = true
}
variable "max_pods_agent_node" {
  description = "Maximum number of pods for agent node pool"
  type        = number
  default     = 110
  
}

variable "max_pods_medium_node" {
  description = "Maximum number of pods for medium node pool"
  type        = number
  default     = 50
  
}

variable "agent_node_vm_size" {
  description = "System Node Pool VM Size"
  type        = string
  default     = "Standard_D2_v3"
}

variable "medium_node_vm_size" {
  description = "User Node Pool VM Size"
  type        = string
  default     = "Standard_D2_v3"
}

variable "node_pool_zones" {
  description = "The list of availability zones for the AKS node pools"
  type        = list(string)
  default     = ["1", "2"] 
}

variable "aks_dns_service_ip" {
  description = "The DNS service IP for the AKS cluster"
  type        = string
  default     = "10.0.0.10"
}

variable "aks_service_cidr" {
  description = "The service CIDR for the AKS cluster"
  type        = string
  default     = "10.0.0.0/16"
  
}