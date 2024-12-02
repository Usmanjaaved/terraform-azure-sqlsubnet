resource "azurerm_subnet" "sql-subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.subnet_address_prefixes
  service_endpoints    = var.service_endpoints

  delegation {
    name = var.delegation_service_name
    service_delegation {
      name    = "Microsoft.DBforMySQL/flexibleServers"
      actions = var.delegation_actions
    }
  }
}
