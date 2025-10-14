module "vnets" {
  source              = "Azure/avm-res-network-virtualnetwork/azurerm"
  version             = "0.8.1"
  resource_group_name = var.resource_group_name
  location            = var.location
  name                = var.name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  delegation          = var.delegation
  private_endpoint_network_policies = var.subnet.private_endpoint_network_policies
  private_link_service_network_policies_enabled = var.subnet.private_link_service_network_policies_enabled
   
}