variable "name" {
  description = "Cosmos DB account name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "offer_type" {
  description = "Cosmos DB offer type"
  type        = string
  default     = "Standard"
}

variable "kind" {
  description = "Cosmos DB kind"
  type        = string
  default     = "MongoDB"
}

variable "public_network_access_enabled" {
  description = "Allow public network access"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags for the Cosmos DB account"
  type        = map(string)
  default     = {}
}

variable "consistency_level" {
  description = "Cosmos DB consistency level"
  type        = string
  default     = "Session"
}

variable "failover_priority" {
  description = "Cosmos DB failover priority"
  type        = number
  default     = 0
}

variable "geo_location" {
  description = "Geo location for Cosmos DB"
  type        = string
  default     = "koreacentral"
}

variable "zone_redundant" {
  description = "Enable zone redundancy"
  type        = bool
  default     = true
}

variable "automatic_failover_enabled" {
  description = "Enable automatic failover"
  type        = bool
  default     = true
}

variable "mongo_server_version" {
  description = "MongoDB server version for Cosmos DB (e.g., 4.2, 5.0, 6.0, 7.0)"
  type        = string
  default     = "7.0"
}
