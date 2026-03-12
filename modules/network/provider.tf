# network 단독 테스트에만 사용, 추후에 root dir로 빼자

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}
