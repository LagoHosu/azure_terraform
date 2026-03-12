resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  sku_tier                     = "Standard"
  automatic_upgrade_channel    = "patch"
  image_cleaner_enabled        = true
  image_cleaner_interval_hours = 168
  local_account_disabled       = true
  oidc_issuer_enabled          = true
  azure_policy_enabled         = false
  workload_identity_enabled    = var.workload_identity_enabled

  # AAD RBAC
  azure_active_directory_role_based_access_control {
    admin_group_object_ids = var.admin_group_object_ids
    tenant_id              = var.tenant_id
  }

  # Node Pool
  default_node_pool {
    name                 = "agentpool"
    vm_size              = var.agent_node_vm_size
    auto_scaling_enabled = true
    min_count            = 2
    max_count            = 2    
    vnet_subnet_id       = var.subnet_id
    zones                = var.node_pool_zones

    max_pods = var.max_pods_agent_node

    upgrade_settings {
      max_surge = "10%"
    }

    only_critical_addons_enabled = true
  }

  # Identity
  identity {
    type = "SystemAssigned"
  }

  # auto-upgrade
  maintenance_window_auto_upgrade {
    day_of_week = "Sunday"
    duration    = 8
    frequency   = "Weekly"
    interval    = 1
    start_time  = "00:00"
    utc_offset  = "+00:00"
  }

  maintenance_window_node_os {
    day_of_week = "Sunday"
    duration    = 8
    frequency   = "Weekly"
    interval    = 1
    start_time  = "00:00"
    utc_offset  = "+00:00"
  }

  monitor_metrics {}

  network_profile {
    network_plugin = "azure"
    # network_plugin_mode = "overlay" #별도 지정 없으면 CNI Node Subnet으로 동작
    dns_service_ip = var.aks_dns_service_ip #"10.0.0.10"
    service_cidr   = var.aks_service_cidr #"10.0.0.0/16"
  }
}


resource "azurerm_role_assignment" "acr_pull" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.identity[0].principal_id  

  depends_on = [azurerm_kubernetes_cluster.aks]
}



###################################

resource "azurerm_kubernetes_cluster_node_pool" "mediumpool" {
  name                  = "mediumpool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.medium_node_vm_size
  mode                  = "User"

  auto_scaling_enabled  = true
  min_count             = 2
  max_count             = 3

  vnet_subnet_id        = var.subnet_id
  # zones                = var.node_pool_zones

  max_pods = var.max_pods_medium_node

  orchestrator_version  = azurerm_kubernetes_cluster.aks.kubernetes_version
}
