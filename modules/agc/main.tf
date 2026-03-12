resource "azurerm_application_load_balancer" "res-0" {
  location            = "koreacentral"
  name                = "agc-lake-xpilot"
  resource_group_name = "rg-lake-prod-xpilot"
}
