############################################
# Outputs  Networking Module
############################################

output "nsg_id" {
  description = "Resource ID of the NSG. Pass to rdc/vnets subnet definitions."
  value       = azurerm_network_security_group.this.id
}

output "nsg_name" {
  description = "Name of the NSG."
  value       = azurerm_network_security_group.this.name
}

output "route_table_id" {
  description = "Resource ID of the Route Table, if created."
  value       = var.create_route_table ? azurerm_route_table.this[0].id : null
}
