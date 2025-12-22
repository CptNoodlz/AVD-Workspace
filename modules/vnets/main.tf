module "vnets" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "0.16.0"

  parent_id = data.azurerm_resource_group.Rg.id

  location      = var.location
  name          = var.name
  address_space = var.address_space
  dns_servers   = var.dns_servers

  subnets = local.normalized_subnets
}

############################################
# Virtual Network Module Wrapper
# Adds inline subnet support by normalizing
# a flexible user-friendly subnets map
# (supports address_prefix or address_prefixes).
############################################

locals {
  normalized_subnets = {
    for sn_name, sn in var.subnets : sn_name => {
      # Always produce a list (AVM expects address_prefixes list)
      address_prefixes = coalesce(
        sn.address_prefixes,
        sn.address_prefix != null ? [sn.address_prefix] : []
      )

      # Only build nested objects when IDs provided
      nat_gateway            = sn.nat_gateway_id != null ? { id = sn.nat_gateway_id } : null
      network_security_group = sn.network_security_group_id != null ? { id = sn.network_security_group_id } : null
      route_table            = sn.route_table_id != null ? { id = sn.route_table_id } : null

      # Service endpoints & policies passthrough
      service_endpoints = sn.service_endpoints
      service_endpoint_policies = sn.service_endpoint_policy_ids != null ? {
        for i, sep_id in sn.service_endpoint_policy_ids : "policy_${i}" => { id = sep_id }
      } : null

      # Policy flags (AVM expects string Enabled/Disabled for private endpoint policies)
      private_endpoint_network_policies             = sn.private_endpoint_network_policies_enabled ? "Enabled" : "Disabled"
      private_link_service_network_policies_enabled = sn.private_link_service_network_policies_enabled

      # Delegation transformed to list (older AVM schema uses list of objects)
      delegation = sn.delegation != null ? [{
        name = sn.delegation.name
        service_delegation = {
          name = sn.delegation.service_delegation.name
          # actions not required in virtual network inline subnet for basic scenario; omit for simplicity
        }
      }] : null
    }
  }
}
