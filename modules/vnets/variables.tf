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
  type = string
}

variable "dns_servers" {
  type = object({
    dns_servers = set(string)
  })
  default     = null
  description = <<DESCRIPTION
(Optional) Specifies a list of IP addresses representing DNS servers.

- `dns_servers`: Set of IP addresses of DNS servers.
DESCRIPTION
}

variable "subnets" {
  type = map(object({
    address_prefix   = optional(string)
    address_prefixes = optional(list(string))
    name             = string
    nat_gateway = optional(object({
      id = string
    }))
    network_security_group = optional(object({
      id = string
    }))
    private_endpoint_network_policies             = optional(string, "Enabled")
    private_link_service_network_policies_enabled = optional(bool, true)
    route_table = optional(object({
      id = string
    }))
    service_endpoint_policies = optional(map(object({
      id = string
    })))
    service_endpoints               = optional(set(string))
    default_outbound_access_enabled = optional(bool, false)
    sharing_scope                   = optional(string, null)
    delegation = optional(list(object({
      name = string
      service_delegation = object({
        name = string
      })
    })))
    timeouts = optional(object({
      create = optional(string, "30m")
      read   = optional(string, "5m")
      update = optional(string, "30m")
      delete = optional(string, "30m")
    }), {})
    retry = optional(object({
      error_message_regex  = optional(list(string), ["ReferencedResourceNotProvisioned"])
      interval_seconds     = optional(number, 10)
      max_interval_seconds = optional(number, 180)
      multiplier           = optional(number, 1.5)
      randomization_factor = optional(number, 0.5)
    }), {})
    role_assignments = optional(map(object({
      role_definition_id_or_name             = string
      principal_id                           = string
      description                            = optional(string, null)
      skip_service_principal_aad_check       = optional(bool, false)
      condition                              = optional(string, null)
      condition_version                      = optional(string, null)
      delegated_managed_identity_resource_id = optional(string, null)
      principal_type                         = optional(string, null)
    })))
  }))
  default     = {}
  description = "All subnet vars"