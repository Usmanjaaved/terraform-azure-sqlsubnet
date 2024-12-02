output "subnet_id" {
  description = "The ID of the SQL Subnet"
  value       = azurerm_subnet.sql-subnet.id
}

output "subnet_name" {
  description = "The name of the SQL Subnet"
  value       = azurerm_subnet.sql-subnet.name
}

output "subnet_address_prefixes" {
  description = "The address prefixes of the SQL Subnet"
  value       = azurerm_subnet.sql-subnet.address_prefixes
}
