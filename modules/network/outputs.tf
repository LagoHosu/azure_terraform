# Virtual Network
output "vnet_id" {
  description = "Virtual Network ID"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "Virtual Network Name"
  value       = azurerm_virtual_network.vnet.name
}

# Subnets
output "default_subnet_id" {
  description = "Default Subnet ID"
  value       = azurerm_subnet.default.id
}

output "default_subnet_name" {
  description = "Default Subnet Name"
  value       = azurerm_subnet.default.name
}

# output "aks_subnet_id" {
#   description = "AKS Subnet ID"
#   value       = azurerm_subnet.aks_subnet.id
# }

# output "aks_subnet_name" {
#   description = "AKS Subnet Name"
#   value       = azurerm_subnet.aks_subnet.name
# }


# Network Security Group
# output "nsg_id" {
#   description = "Network Security Group ID"
#   value       = azurerm_network_security_group.res-0.id
# }

# output "nsg_name" {
#   description = "Network Security Group Name"
#   value       = azurerm_network_security_group.res-0.name
# }

