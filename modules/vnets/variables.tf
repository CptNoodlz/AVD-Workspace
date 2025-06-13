variable "address_space" {
  type        = string
  description = "Vnet Address that is used for the subnets."


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
  type    = list(string)
  default = ["8.8.8.8"]
}

variable "subnets" {
  type = map(object({
    name             = string
    address_prefixes = list(string)
  }))

}