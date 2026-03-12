# data "azurerm_client_config" "current" {}

# resource "azapi_resource" "ai_foundry" {
#   type      = var.ai_foundry_type # "Microsoft.CognitiveServices/accounts@2025-04-01-preview"
#   name      = var.name
#   location  = var.location
#   parent_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${var.resource_group_name}"



#   body = {
#     kind = "AIServices"
#     identity = {
#       type = var.ai_foundry_identity_type
#     }
#     sku = {
#       name = var.sku_name
#     }
#     properties = {
#       customSubDomainName    = var.ai_foundry_custom_subdomain_name
#       publicNetworkAccess    = var.ai_foundry_public_network_access
#       disableLocalAuth       = var.local_authentication_disabled
#       allowProjectManagement = var.allowProjectManagement
#       userOwnedStorage = [
#         {
#           resourceId = var.user_owned_storage_id
#         }
#       ]
#       networkAcls = {
#         bypass        = var.network_acls_bypass
#         defaultAction = var.network_acls_default_action
#       }
#     }
#   }
# }

# resource "azurerm_cognitive_account_project" "this" {
#   name                 = var.associated_projects[0]
#   location             = var.location
#   cognitive_account_id = azapi_resource.ai_foundry.id

#   identity {
#     type = var.ai_foundry_identity_type
#   }

#   depends_on = [
#     azapi_resource.ai_foundry
#   ]
# }

#################################################
# resource "azurerm_cognitive_services_account" "this" {
#   name                         = var.name
#   location                     = var.location
#   resource_group_name          = var.resource_group_name
#   custom_subdomain_name        = var.ai_foundry_custom_subdomain_name
#   public_network_access        = var.ai_foundry_public_network_access
#   sku_name                     = var.sku_name
#   local_authentication_enabled = var.local_authentication_enabled
#   kind                         = "AIServices"

#   properties {
#     allowProjectManagement = true
#   }

#   identity {
#     type = var.ai_foundry_identity_type
#   }

#   network_acls {
#     bypass         = var.network_acls_bypass
#     default_action = var.network_acls_default_action
#   }
# }


# resource "azurerm_cognitive_account_project" "this" {
#   name                 = var.associated_projects[0]
#   identity {
#     type = var.ai_foundry_identity_type
#   }
#   location = var.location
#   cognitive_account_id = azurerm_cognitive_services_account.this.id
# }

###########################################################

data "azurerm_client_config" "current" {}

resource "azapi_resource" "ai_foundry" {
  type      = var.ai_foundry_type # "Microsoft.CognitiveServices/accounts@2025-04-01-preview"
  name      = var.name
  location  = var.location
  parent_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${var.resource_group_name}"

  body = {
    kind = "AIServices"
    identity = {
      type = var.ai_foundry_identity_type
    }
    sku = {
      name = var.sku_name
    }
    properties = {
      customSubDomainName    = var.ai_foundry_custom_subdomain_name
      publicNetworkAccess    = var.ai_foundry_public_network_access
      disableLocalAuth       = var.local_authentication_disabled
      allowProjectManagement = var.allowProjectManagement
      userOwnedStorage = [
        {
          resourceId = var.user_owned_storage_id
        }
      ]
      networkAcls = {
        bypass        = var.network_acls_bypass
        defaultAction = var.network_acls_default_action
      }
    }
  }
}

resource "azurerm_cognitive_account_project" "this" {
  name                 = var.associated_projects[0]
  location             = var.location
  cognitive_account_id = azapi_resource.ai_foundry.id

  identity {
    type = var.ai_foundry_identity_type
  }

  depends_on = [
    azapi_resource.ai_foundry
  ]
}