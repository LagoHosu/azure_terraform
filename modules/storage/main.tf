resource "azurerm_storage_account" "this" {
  name                            = var.name
  resource_group_name             = var.resource_group_name
  location                        = var.location

  account_tier                    = var.account_tier
  account_replication_type        = var.account_replication_type

  allow_nested_items_to_be_public  = var.allow_nested_items_to_be_public
  default_to_oauth_authentication  = var.default_to_oauth_authentication
  is_hns_enabled                   = var.is_hns_enabled
  public_network_access_enabled    = var.public_network_access_enabled

  local_user_enabled = var.is_local_user_enabled

  network_rules {
    default_action = var.acls_default_action
  }

  large_file_share_enabled = var.large_file_share_enabled

  # tags = var.tags
}
