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

variable "subnetname" {
  type = map(list)
}

variable "subnets" {
  type = map(list)
}