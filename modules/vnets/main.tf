module "vnets" {
    source  = "Azure/avm-res-network-virtualnetwork/azurerm//examples/complete"
    version = "0.8.1"
    resource_group_name = var.resource_group_name
    location = var.location
    name = var.name
    address_space = var.address_space
    dns_servers = var.dns_servers
}