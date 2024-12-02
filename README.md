# Terraform Azure SQL Subnet Module

This Terraform module provisions a subnet within an existing Azure Virtual Network, specifically tailored for Microsoft MySQL Flexible Servers. It includes service delegation, service endpoints, and configurable subnet address prefixes.

## Features
- Creates an Azure subnet in a specified virtual network.
- Configures service endpoints for the subnet.
- Sets up service delegation for Microsoft DB for MySQL Flexible Servers.
- Outputs essential information like subnet ID, name, and address prefixes.

## Usage

### Root Module Example

```hcl
module "sql_subnet" {
  source = "./modules/sql_subnet"
  subnet_name             = "mysql-sn"
  resource_group_name     = module.azurerm_resource_group.resource_group_name
  virtual_network_name    = module.virtual_network.vnet_name
  subnet_address_prefixes = var.sql_subnet_address_prefixes
  service_endpoints       = ["Microsoft.Storage"]
  delegation_service_name = "fs"
  delegation_actions      = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
}
This example demonstrates how to use the sql_subnet module in a root configuration. The module provisions the subnet mysql-sn, associates it with a virtual network, and configures necessary settings like address prefixes and service endpoints.

Input Variables

subnet_name: The name of the subnet. (Type: string, Required: Yes)
resource_group_name: The resource group where the subnet will be created. (Type: string, Required: Yes)
virtual_network_name: The virtual network the subnet belongs to. (Type: string, Required: Yes)
subnet_address_prefixes: The address prefixes for the subnet. (Type: list(string), Required: Yes)
service_endpoints: A list of service endpoints for the subnet. (Type: list(string), Default: [], Required: No)
delegation_service_name: The name of the service delegation. (Type: string, Required: Yes)
delegation_actions: List of actions allowed for the service delegation. (Type: list(string), Required: Yes)

Outputs
subnet_id: The ID of the created subnet.
subnet_name: The name of the created subnet.
subnet_address_prefixes: The address prefixes of the created subnet.
Example Scenario
To set up a subnet for SQL (MySQL) flexible servers:

Define your Azure infrastructure (e.g., resource group and virtual network).
Configure the necessary subnet address prefixes, service endpoints, and delegation.
Use the example Usage code above to create the subnet.
Run terraform apply to deploy the infrastructure.

Prerequisites
Existing Azure Resource Group and Virtual Network.
The subnet's address prefixes and service endpoints should be defined based on your network architectur