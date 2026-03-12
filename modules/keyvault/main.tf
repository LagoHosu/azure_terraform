resource "azurerm_key_vault" "this" {
  name                          = var.name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  public_network_access_enabled = var.public_network_access_enabled
  sku_name                      = var.sku_name
  tenant_id                     = var.tenant_id

  rbac_authorization_enabled = var.rbac_authorization_enabled
  soft_delete_retention_days = var.soft_delete_retention_days

}
