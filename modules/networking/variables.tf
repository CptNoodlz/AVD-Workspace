############################################
# Variable Definitions  Networking Module
############################################

variable "nsg_name" {
  type        = string
  description = "Name of the Network Security Group."
}

variable "location" {
  type        = string
  description = "Azure region."
  default     = "East US 2"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group for NSG and Route Table."
}

variable "create_route_table" {
  type        = bool
  description = "Whether to create a Route Table alongside the NSG."
  default     = false
}

variable "route_table_name" {
  type        = string
  description = "Name of the Route Table. Only used if create_route_table = true."
  default     = null
}

variable "nsg_rules" {
  description = "Map of NSG rules to create."
  type = map(object({
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = {}
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all networking resources."
  default     = {}
}
