###########################################
## base
###########################################

variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
}

variable "location" {
  type        = string
  description = "Azure Region"
}

variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
}

###########################################
## vnet
###########################################

# variable "vnet_name" {
#   description = "Virtual Network 이름"
#   type        = string
# }

variable "vnet_address_space" {
  description = "VNet address space"
  type        = list(string)
  default     = ["10.200.0.0/16"]
}

variable "default_subnet_space" {
  description = "Default subnet address space"
  type        = list(string)
  default     = ["10.200.0.0/18"]
}

variable "default_subnet_name" {
  description = "Default subnet name"
  type        = string
  default     = "default"
}

# variable "aks_subnet_space" {
#   description = "AKS subnet address space"
#   type        = list(string)
#   default     = ["10.210.0.0/18"]
# }

# variable "aks_subnet_name" {
#   description = "AKS subnet name"
#   type        = string
#   default     = "aks-subnet"
# }


###########################################
## acr
###########################################

# variable "acr_name" {
#   type        = string
#   description = "ACR name"
# }


###########################################
## aks
###########################################

variable "tenant_id" {
  description = "The tenant ID for Azure Active Directory"
  type        = string
}

# variable "aks_name" {
#   description = "The name of the AKS cluster"
#   type        = string
# }

# variable "dns_prefix" {
#   description = "The DNS prefix for the AKS cluster"
#   type        = string
# }


variable "acr_id" {
  description = "The ID of the Azure Container Registry (ACR) to integrate with AKS"
  type        = string
  default     = ""
}

# variable "subnet_id" {
#   description = "The ID of the subnet where AKS will be deployed"
#   type        = string
# }

variable "admin_group_name" {
  description = "The display name of the Azure AD group"
  type        = string
}

# variable "admin_group_object_ids" {
#   description = "The Azure AD Group Object IDs for AKS RBAC"
#   type        = list(string)
# }

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

variable "aks_zone" {
  description = "The list of availability zones for the AKS cluster"
  type        = list(string)
  default     = ["1", "3"]
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

###########################################
## postgres
###########################################

# variable "postgres_name" {
#   type        = string
#   description = "PostgreSQL name"
# }

# password_auth_enabled=false 시 admin_username와 admin_password 불필요
# variable "admin_username" {
#   type        = string
#   description = "PostgreSQL admin username"
#   default     = "pgadmin"
# }

# variable "admin_password" {
#   type        = string
#   description = "PostgreSQL admin password"
# }

variable "postgres_version" {
  type    = string
  default = "14"
}

variable "postgres_zone" {
  type    = string
  default = "3"
}

variable "storage_mb" {
  type    = number
  default = 32768
}

variable "sku_name" {
  type    = string
  default = "Standard_D2s_v3"
}

variable "active_directory_auth_enabled" {
  type        = bool
  default     = true
}

variable "password_auth_enabled" {
  type        = bool
  default     = true
}

variable "postgres_tenant_id" {
  type        = string
  description = "Azure AD Tenant ID for PostgreSQL authentication"
}


###########################################
## storage account
###########################################

# variable "storage_name" {
#   type = string
# }

variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "account_replication_type" {
  type    = string
  default = "RAGZRS"
}

variable "allow_nested_items_to_be_public" {
  type    = bool
  default = false
}

variable "default_to_oauth_authentication" {
  type    = bool
  default = true
}

variable "is_hns_enabled" {
  type    = bool
  default = true
}

variable "storage_public_network_access_enabled" {
  type    = bool
  default = false
}

variable "storage_is_local_user_enabled" {
  description = "Enable local user authentication"
  type        = bool
  default     = false
  
}

variable "storage_acls_default_action" {
  description = "Defines the default action for network ACLs"
  type        = string
  default     = "Allow"
}

variable "large_file_share_enabled" {
  description = "Enable large file shares (100TiB)"
  type        = bool
  default     = false  
}

variable "storage_tags" {
  description = "Resource tags for the storage account"
  type        = map(string)
  default     = {}
}


###########################################
## cosmos
###########################################

# variable "cosmos_name" {
#   description = "Cosmos DB account name"
#   type        = string
# }

variable "offer_type" {
  description = "Cosmos DB offer type"
  type        = string
  default     = "Standard"
}

variable "kind" {
  description = "Cosmos DB kind"
  type        = string
  default     = "MongoDB"
}

variable "cosmos_public_network_access_enabled" {
  description = "Allow public network access"
  type        = bool
  default     = false
}

variable "cosmos_tags" {
  description = "Tags for the Cosmos DB account"
  type        = map(string)
  default     = {}
}

variable "consistency_level" {
  description = "Cosmos DB consistency level"
  type        = string
  default     = "Session"
}

variable "failover_priority" {
  description = "Cosmos DB failover priority"
  type        = number
  default     = 0
}

variable "geo_location" {
  description = "Geo location for Cosmos DB"
  type        = string
  default     = "koreacentral"
}

variable "zone_redundant" {
  description = "Enable zone redundancy"
  type        = bool
  default     = true
}

variable "automatic_failover_enabled" {
  description = "Enable automatic failover"
  type        = bool
  default     = true
}

variable "mongo_server_version" {
  description = "MongoDB server version for Cosmos DB (e.g., 4.2, 5.0, 6.0, 7.0)"
  type        = string
  default     = "7.0"
}

###########################################
## key vault
###########################################

# variable "key_vault_name" {
#   description = "The name of the Key Vault"
#   type        = string
# }

variable "key_vault_public_network_access_enabled" {
  description = "Enable or disable public network access to the Key Vault"
  type        = bool
  default     = false
}

variable "key_vault_sku_name" {
  description = "The SKU name of the Key Vault (e.g., standard)"
  type        = string
  default     = "standard"
}

variable "key_vault_tenant_id" {
  description = "The Azure AD tenant ID associated with the Key Vault"
  type        = string
}

variable "key_vault_rbac_authorization_enabled" {
  description = "Enable or disable RBAC authorization for the Key Vault"
  type        = bool
  default     = true
}

variable "key_vault_soft_delete_retention_days" {
  description = "The number of days to retain deleted Key Vaults (soft delete)"
  type        = number
  default     = 90
  
}


###########################################
## ai foundry
###########################################

# variable "ai_foundry_name" {
#   description = "The name of the AI Foundry service"
#   type        = string
# }

# variable "ai_foundry_custom_subdomain_name" {
#   description = "The custom subdomain name for the AI Foundry service"
#   type        = string
# }

variable "ai_foundry_public_network_access" {
  description = "Enables or disables public network access for the AI Foundry service"
  type        = string
  default     = "Disabled"
}

variable "ai_foundry_sku_name" {
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
  description = "Specifies whether local authentication is disabled"
  type        = bool
  default     = false
}

variable "associated_projects" {
  description = "List of associated project names for the AI Foundry service"
  type        = list(string)
  default     = ["proj-default"]
}

variable "ai_foundry_allowProjectManagement" {
  description = "Indicates whether project management is allowed for the AI Foundry service"
  type        = bool
  default     = true
}

variable "ai_foundry_type" {
  description = "The type of the AI Foundry service"
  type        = string
  # default     = "Microsoft.CognitiveServices/accounts@2025-04-01-preview"
}

###########################################
## service bus
###########################################
# variable "servicebus_name" {
#   description = "The name of the Service Bus Namespace"
#   type        = string
# }


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

###########################################
## communication service
###########################################
variable "data_location" {
  description = "The data location for the Communication Service"
  type        = string
  default     = "Korea"
}


###########################################
## private endpoint
###########################################
# variable "subnet_id" {
#   description = "The ID of the subnet where the private endpoint will be deployed"
#   type        = string
# }

# variable "resource_id" {
#   description = "The resource ID of the Azure service (e.g., KeyVault, PostgreSQL, etc.)"
#   type        = string
# }

# variable "subresource_names" {
#   description = "The list of subresource names to connect to (e.g., for KeyVault it will be ['vault'])"
#   type        = list(string)
# }

variable "resource_name" {
  description = "local name for the resource being connected (used for naming the private endpoint)"
  type        = string
}

# variable "name" {
#   description = "The name of the private endpoint"
#   type        = string
# }
