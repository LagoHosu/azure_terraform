# base
resource_name = "laketf11" #알파벳만 입력(특수문자 불가)

resource_group_name = "rg-lake-prod-xpilot" #rg-xpilot-paas-test
location            = "koreacentral"

subscription_id = "79858e0d-1a6b-4719-a633-180a5274b6dd"
tenant_id = "6fa75e6f-8a8b-4b10-8a3b-99d22acbb04e" # Azure Active Directory의 테넌트 ID, [az account show --query tenantId --output tsv] 명령어로 조회해 입력

# network
# vnet_name          = "vnet-xpilot"
vnet_address_space = ["10.200.0.0/16"]

default_subnet_name  = "xpilot"
default_subnet_space = ["10.200.0.0/18"]

# aks_subnet_name  = "aks-subnet"
# aks_subnet_space = ["10.210.0.0/18"]


# acr
# acr_name = "acrxpilottf" #리소스 이름은 모두 local에서 참조

# aks
# dns_prefix           = "aks-xpilot-dns" 
# subnet_id            = data.azurerm_subnet.aks_subnet.id
# acr_id               = module.acr.acr_id 
# admin_group_object_ids = [data.azurerm_azuread_group.admin_group.id]

admin_group_name     = "플랫폼팀" # Azure AD 그룹 이름
max_pods_agent_node  = 110
max_pods_medium_node = 50
aks_zone             = ["1", "3"]

aks_dns_service_ip = "10.0.0.10"
aks_service_cidr   = "10.0.0.0/16"

# postgres
# postgres_name  = "postgre-xpilot"
# admin_username = "azureuser"       # password_auth_enabled=false 시 불필요
# admin_password = "Xpilot1234!"    # password_auth_enabled=false 시 불필요

postgres_version              = "17"
postgres_zone                 = "3"
storage_mb                    = 32768
sku_name                      = "B_Standard_B2s"
active_directory_auth_enabled = true
password_auth_enabled         = false                                  # true

# storage account
# storage_name = "filesxpilot"

account_tier             = "Standard"
account_replication_type = "RAGZRS"

allow_nested_items_to_be_public       = false
default_to_oauth_authentication       = true
is_hns_enabled                        = true
storage_public_network_access_enabled = false
storage_is_local_user_enabled         = false
storage_acls_default_action           = "Deny"

large_file_share_enabled              = true


# storage_tags = {
#   environment = "prod"
#   workload    = "lake"
# }

# cosmos
# cosmos_name = "mongo-xpilot"

offer_type                           = "Standard"
kind                                 = "MongoDB"
cosmos_public_network_access_enabled = false

# cosmos_tags = {
#   defaultExperience       = "Azure Cosmos DB for MongoDB API"
#   hidden-cosmos-mmspecial = ""
#   hidden-workload-type    = "Production"
# }

consistency_level          = "Session"
failover_priority          = 0
geo_location               = "koreacentral"
zone_redundant             = true
automatic_failover_enabled = true
mongo_server_version       = "7.0"


# key vault
# key_vault_name                          = "kv-xpilot"
key_vault_public_network_access_enabled = false
key_vault_sku_name                      = "standard"
key_vault_rbac_authorization_enabled    = true
key_vault_soft_delete_retention_days    = 90

# cognitive
# ai_foundry_name                  = "foundry-xpilot"
# ai_foundry_custom_subdomain_name = "foundry-xpilot"
ai_foundry_public_network_access  = "Disabled"
ai_foundry_sku_name               = "S0"
ai_foundry_identity_type          = "SystemAssigned"
network_acls_bypass               = "None"
network_acls_default_action       = "Deny"
local_authentication_disabled     = true
ai_foundry_allowProjectManagement = true
associated_projects               = ["proj-default"]
ai_foundry_type                   = "Microsoft.CognitiveServices/accounts@2025-04-01-preview"


# service bus
# servicebus_name    = "sb-xpilot"
servicebus_sku     = "Standard"
local_auth_enabled = false


# private endpoint
# name = "pep-keyvault"
# resource_id = "value"


# communication service
# communication_service_name = "cs-xpilot"
data_location = "Korea"
