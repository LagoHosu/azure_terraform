output "aks_cluster_id" {
  description = "The ID of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.id
}

output "aks_cluster_name" {
  description = "The name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}


output "aks_managed_identity_client_id" {
  description = "The client ID of the AKS managed identity"
  value       = azurerm_kubernetes_cluster.aks.identity[0].principal_id
}

output "aks_managed_identity_object_id" {
  description = "The object ID of the AKS managed identity"
  value       = azurerm_kubernetes_cluster.aks.identity[0].principal_id
}

output "aks_kubelet_identity_object_id" {
  description = "The object ID of the AKS kubelet (node) managed identity in MC resource group"
  value       = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}

output "mc_resource_group_name" {
  description = "The name of the Managed Cluster resource group"
  value       = split("/", azurerm_kubernetes_cluster.aks.id)[4]  # 리소스 ID에서 리소스 그룹 추출
}