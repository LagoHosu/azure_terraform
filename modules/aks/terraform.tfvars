# resource_group_name = "rg-lake-prod-xpilot"
# location            = "koreacentral"

# vnet_name           = "vnet-lake-prod-xpilot"
# vnet_address_space  = ["10.200.0.0/16"]

# aks_name            = "aks-lake-xpilot-2"
dns_prefix          = "aks-lake-xpilot-2-dns"
# admin_group_object_ids = ["c6ce6eaa-ffad-40ae-ac83-28599d985b4a"]
# tenant_id           = "6fa75e6f-8a8b-4b10-8a3b-99d22acbb04e" 
subnet_id           = "/subscriptions/79858e0d-1a6b-4719-a633-180a5274b6dd/resourceGroups/rg-lake-prod-xpilot/providers/Microsoft.Network/virtualNetworks/vnet-lake-prod-xpilot/subnets/aks-subnet"
node_pool_zones      = ["1", "2"] 

agent_node_vm_size = "Standard_D4as_v5"
medium_node_vm_size = "Standard_D4as_v5"

# ACR
acr_id              = "/subscriptions/79858e0d-1a6b-4719-a633-180a5274b6dd/resourceGroups/rg-lake-prod-xpilot/providers/Microsoft.ContainerRegistry/registries/acr-lake-xpilot"


# # terraform.tfvars
# aks_name               = "aks-lake-xpilot-2"
# location               = "koreacentral"
# resource_group_name    = "rg-lake-prod-xpilot"
# vnet_name              = module.network.vnet_name
# vnet_address_space     = module.network.vnet_address_space
# subnet_id              = module.network.aks_subnet_id
# acr_id                 = module.acr.acr_id
# admin_group_object_ids = ["c6ce6eaa-ffad-40ae-ac83-28599d985b4a"]
# tenant_id              = "6fa75e6f-8a8b-4b10-8a3b-99d22acbb04e"
