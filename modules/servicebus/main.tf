resource "azurerm_servicebus_namespace" "this" {
  location            = var.location
  name                = var.servicebus_name
  resource_group_name = var.resource_group_name
  sku                 = var.servicebus_sku
  local_auth_enabled  = var.local_auth_enabled
}