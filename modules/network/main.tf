### Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_address_space
}

### Network Security Group (필요한 경우 NSG/NSG규칙 추가)
# resource "azurerm_network_security_group" "res-0" {
#   location            = "koreacentral"
#   name                = "nsg-lake-terraform"
#   resource_group_name = var.resource_group_name
#   # resource_group_name = "rg-lake-prod-xpilot"
# }


### Subnets
resource "azurerm_subnet" "default" {
  name                 = var.default_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.default_subnet_space

  # Private Endpoint 정책 예시
  private_endpoint_network_policies = "Disabled"


  # 서브넷을 AKS에 위임 -> 별도의 서브넷을 사용하지 않을거라면 delegation 필요 없음
  # delegation {
  #   name = "aks-delegation"

  #   service_delegation {
  #     name    = "Microsoft.ContainerService/managedClusters"
  #     actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
  #   }
  # }

  # 서비스 엔드포인트를 활성화 (AKS에 필요한 서비스 엔드포인트)
  # service_endpoints = ["Microsoft.ContainerService"]

}

# 별도의 subnet 만들때 사용
# resource "azurerm_subnet" "aks_subnet" {
#   name                 = var.aks_subnet_name
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = var.aks_subnet_space

#   private_endpoint_network_policies = "Disabled"
# }


