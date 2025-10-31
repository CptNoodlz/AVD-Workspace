############################################
# Variable Definitions for VNet Wrapper
# Provides flexible inline subnet declarations
# Normalized via locals in main.tf
############################################

variable "address_space" {
  type        = set(string)
  description = "(Optional) The address spaces applied to the virtual network. You can supply more than one address space."
  nullable    = false

  validation {
    condition     = length(var.address_space) > 0
    error_message = "Address space must contain at least one element."
  }
}

variable "location" {
  type        = string
  description = "The default location."
  default     = "eastus"
}

variable "name" {
  type        = string
  description = "Name of the vnet."
}

variable "resource_group_name" {
  type        = string
  description = "Resource group in which the VNet will be created."
}

# AVM vnet module expects a simple list of DNS server IPs.
# We wrap it the same way you originally had; if unnecessary you can
# simplify later to just list(string).
variable "dns_servers" {
  type = object({
    dns_servers = set(string)
  })
  default     = null
  description = <<DESCRIPTION
(Optional) Specifies a list of IP addresses representing DNS servers.

- dns_servers: Set of IP addresses of DNS servers.
DESCRIPTION
}

# New simplified subnets variable schema.
# Map key = subnet name.
# Users can supply either address_prefix (single CIDR) or address_prefixes (list).
# Normalization occurs in main.tf.
variable "subnets" {
  description = "Map of subnet definitions keyed by subnet name."
  type = map(object({
    address_prefixes  = optional(list(string))
    address_prefix    = optional(string)

    nat_gateway_id             = optional(string)
    network_security_group_id  = optional(string)
    route_table_id             = optional(string)

    service_endpoints            = optional(list(string))
    service_endpoint_policy_ids  = optional(list(string))

    private_endpoint_network_policies_enabled     = optional(bool, true)
    private_link_service_network_policies_enabled = optional(bool, true)

    delegation = optional(object({
      name = string
      service_delegation = object({
        name    = string
        actions = optional(list(string), [])
      })
    }))
  }))
  default = {}
}


/*
variables you slt

variable "location" {
  description = "The location for resources"
  default     = "eastus2"
}
*/