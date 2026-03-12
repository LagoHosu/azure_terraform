provider "azuread" {
  tenant_id = var.tenant_id
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}



module "network" {
  source              = "./modules/network"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = local.vnet_name
  vnet_address_space  = var.vnet_address_space

  default_subnet_name  = var.default_subnet_name
  default_subnet_space = var.default_subnet_space

  subscription_id = var.subscription_id
  # cosmosdb_id =   
  # keyvault_id = 
  # postgresql_id = 
  # storage_account_id = 
}

module "acr" {
  source              = "./modules/acr"
  resource_group_name = var.resource_group_name
  acr_name            = local.acr_name
  location            = var.location
}


module "postgres" {
  source              = "./modules/postgres"
  resource_group_name = var.resource_group_name
  location            = var.location

  postgres_name = local.postgres_name
  tenant_id     = var.tenant_id
  # admin_username   = var.admin_username
  # admin_password   = var.admin_password
  postgres_version = var.postgres_version
  postgres_zone    = var.postgres_zone
  storage_mb       = var.storage_mb
  sku_name         = var.sku_name

  active_directory_auth_enabled = var.active_directory_auth_enabled
  password_auth_enabled         = var.password_auth_enabled
}


module "storage" {
  source              = "./modules/storage"
  name                = local.storage_name
  resource_group_name = var.resource_group_name
  location            = var.location

  account_tier                    = var.account_tier
  account_replication_type        = var.account_replication_type
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public
  default_to_oauth_authentication = var.default_to_oauth_authentication
  is_hns_enabled                  = var.is_hns_enabled
  public_network_access_enabled   = var.storage_public_network_access_enabled
  is_local_user_enabled           = var.storage_is_local_user_enabled
  acls_default_action             = var.storage_acls_default_action
  large_file_share_enabled        = var.large_file_share_enabled

  tags = var.storage_tags
}

module "cosmos" {
  source = "./modules/cosmos"

  name                          = local.cosmos_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  offer_type                    = var.offer_type
  kind                          = var.kind
  public_network_access_enabled = var.cosmos_public_network_access_enabled

  tags = var.cosmos_tags

  consistency_level = var.consistency_level

  failover_priority = var.failover_priority
  geo_location      = var.geo_location
  zone_redundant    = var.zone_redundant

  automatic_failover_enabled = var.automatic_failover_enabled
  mongo_server_version       = "7.0"
}


module "keyvault" {
  source = "./modules/keyvault"

  name                          = local.key_vault_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  public_network_access_enabled = var.key_vault_public_network_access_enabled
  sku_name                      = var.key_vault_sku_name
  tenant_id                     = var.tenant_id
  soft_delete_retention_days    = var.key_vault_soft_delete_retention_days
}

module "ai_foundry" {
  source = "./modules/cognitive"

  name                             = local.ai_foundry_name
  location                         = var.location
  resource_group_name              = var.resource_group_name
  ai_foundry_custom_subdomain_name = local.ai_foundry_custom_subdomain_name
  ai_foundry_public_network_access = var.ai_foundry_public_network_access
  sku_name                         = var.ai_foundry_sku_name
  ai_foundry_identity_type         = var.ai_foundry_identity_type
  network_acls_bypass              = var.network_acls_bypass
  network_acls_default_action      = var.network_acls_default_action
  local_authentication_disabled    = var.local_authentication_disabled
  associated_projects              = var.associated_projects
  ai_foundry_type                  = var.ai_foundry_type
  user_owned_storage_id            = module.storage.storage_account_id

  depends_on = [module.storage]
}


module "servicebus" {
  source = "./modules/servicebus"

  servicebus_name     = local.servicebus_name
  location            = var.location
  resource_group_name = var.resource_group_name
  servicebus_sku      = var.servicebus_sku
  local_auth_enabled  = var.local_auth_enabled
}


module "communication_service" {
  source = "./modules/communication"

  communication_service_name = local.communication_service_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  data_location              = var.data_location
  # servicebus_sku      = var.servicebus_sku
  # local_auth_enabled  = var.local_auth_enabled
}


data "azuread_group" "admin_group" {
  display_name = var.admin_group_name # var로 입력받은 그룹 이름을 통해 Object ID 조회
}

module "aks" {
  source = "./modules/aks"

  aks_name            = local.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  vnet_name           = local.vnet_name
  vnet_address_space  = var.vnet_address_space
  dns_prefix          = "aks-${var.resource_name}-dns"
  subnet_id           = module.network.default_subnet_id
  node_pool_zones     = var.aks_zone
  agent_node_vm_size  = var.agent_node_vm_size
  medium_node_vm_size = var.medium_node_vm_size

  tenant_id              = var.tenant_id
  acr_id                 = module.acr.acr_id                          # ACR이 생성된 후 참조
  admin_group_object_ids = [data.azuread_group.admin_group.object_id] # Object ID로 전달



}

# private endpoint
module "keyvault_pe" {
  source = "./modules/private-endpoint"

  name                = "pep-keyvault"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.network.default_subnet_id

  resource_id       = module.keyvault.key_vault_id
  subresource_names = ["vault"]
}

module "postgres_pe" {
  source = "./modules/private-endpoint"

  name                = "pep-postgres"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.network.default_subnet_id

  resource_id       = module.postgres.postgres_id
  subresource_names = ["postgresqlServer"]
}

module "storage_blob_pe" {
  source = "./modules/private-endpoint"

  name                = "pep-storage-blob"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.network.default_subnet_id

  resource_id       = module.storage.storage_account_id
  subresource_names = ["blob"]
}

module "cosmos_pe" {
  source = "./modules/private-endpoint"

  name                = "pep-cosmos"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.network.default_subnet_id

  resource_id       = module.cosmos.cosmosdb_account_id
  subresource_names = ["MongoDB"]
}

module "ai_pe" {
  source = "./modules/private-endpoint"

  name                = "pep-ai"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.network.default_subnet_id

  resource_id       = module.ai_foundry.ai_foundry_id
  subresource_names = ["account"]
}


# RBAC Role Assignments for AKS Managed Identity
resource "azurerm_role_assignment" "aks_storage_blob" {
  scope                = module.storage.storage_account_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = module.aks.aks_kubelet_identity_object_id

  depends_on = [module.aks]
}

resource "azurerm_role_assignment" "aks_cosmos_operator" {
  scope                = module.cosmos.cosmosdb_account_id
  role_definition_name = "Cosmos DB Operator"
  principal_id         = module.aks.aks_kubelet_identity_object_id

  depends_on = [module.aks]
}

resource "azurerm_role_assignment" "aks_keyvault_secrets_officer" {
  scope                = module.keyvault.key_vault_id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = module.aks.aks_kubelet_identity_object_id

  depends_on = [module.aks]
}

resource "azurerm_role_assignment" "aks_ai_administrator" {
  scope                = module.ai_foundry.ai_foundry_id
  role_definition_name = "Azure AI Administrator"
  principal_id         = module.aks.aks_kubelet_identity_object_id

  depends_on = [module.aks]
}

resource "azurerm_role_assignment" "aks_ai_developer" {
  scope                = module.ai_foundry.ai_foundry_id
  role_definition_name = "Azure AI Developer"
  principal_id         = module.aks.aks_kubelet_identity_object_id

  depends_on = [module.aks]
}

resource "azurerm_role_assignment" "aks_servicebus_owner" {
  scope                = module.servicebus.servicebus_namespace_id
  role_definition_name = "Azure Service Bus Data Owner"
  principal_id         = module.aks.aks_kubelet_identity_object_id

  depends_on = [module.aks]
}

resource "azurerm_role_assignment" "aks_communication_owner" {
  scope                = module.communication_service.communication_service_id
  role_definition_name = "Communication and Email Service Owner"
  principal_id         = module.aks.aks_kubelet_identity_object_id

  depends_on = [module.aks]
}

# Resource Group role assignments
resource "azurerm_role_assignment" "kubelet_rg_owner" {
  scope                = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}"
  role_definition_name = "Owner"
  principal_id         = module.aks.aks_kubelet_identity_object_id

  depends_on = [module.aks]
}

resource "azurerm_role_assignment" "kubelet_rg_contributor" {
  scope                = "/subscriptions/${var.subscription_id}/resourceGroups/${var.resource_group_name}"
  role_definition_name = "Contributor"
  principal_id         = module.aks.aks_kubelet_identity_object_id

  depends_on = [module.aks]
}
