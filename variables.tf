# modules/subnet/variables.tf

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name where subnet will be created"
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the virtual network the subnet belongs to"
  type        = string
}

variable "subnet_address_prefixes" {
  description = "Address prefixes for the subnet"
  type        = list(string)
}

variable "service_endpoints" {
  description = "List of service endpoints for the subnet"
  type        = list(string)
}

variable "delegation_service_name" {
  description = "The name of the service delegation"
  type        = string
}

variable "delegation_actions" {
  description = "List of actions allowed for the delegation"
  type        = list(string)
}
