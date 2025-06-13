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
  }))
  default = {}
}