resource "azurerm_cosmosdb_account" "this" {
  name                          = var.name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  offer_type                    = var.offer_type
  kind                          = var.kind
  public_network_access_enabled = var.public_network_access_enabled

  

  # tags = var.tags

  consistency_policy {
    consistency_level = var.consistency_level
  }

  geo_location {
    failover_priority = var.failover_priority
    location          = var.geo_location
    zone_redundant    = var.zone_redundant
  }

  automatic_failover_enabled = var.automatic_failover_enabled
  mongo_server_version       = var.mongo_server_version
}
