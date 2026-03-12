provider "azurerm" {
  features {
  }
  use_msi                         = false
  use_cli                         = true
  use_oidc                        = false
  resource_provider_registrations = "none"
  subscription_id                 = "79858e0d-1a6b-4719-a633-180a5274b6dd"
  environment                     = "public"
}
