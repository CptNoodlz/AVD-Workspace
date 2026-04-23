############################################
# Dev Environment - AKS
# Wires modules/aks with RDC subnet IDs.
# VNet + subnets are owned by rdc/vnets.
# This env only consumes subnet IDs via data source.
############################################

data "azurerm_subnet" "aks_system" {
  name                 = "snet-aks-system"
  virtual_network_name = "vnet-rdc-aks-eastus2"
  resource_group_name  = "Testrg1"
}

module "aks_dev" {
  source = "../../modules/aks"

  name                = "aks-dev-eastus2"
  location            = "East US 2"
  resource_group_name = "Testrg1"

  kubernetes_version      = "1.29"
  sku_tier                = "Standard"
  private_cluster_enabled = false

  default_node_pool_vm_size         = "Standard_D2s_v3"
  default_node_pool_node_count      = 2
  default_node_pool_os_disk_size_gb = 128
  default_node_pool_subnet_id       = data.azurerm_subnet.aks_system.id

  network_plugin = "azure"
  network_policy = "azure"
  dns_service_ip = "10.1.0.10"
  service_cidr   = "10.1.0.0/16"

  tags = {
    environment = "dev"
    managed_by  = "terraform"
    purpose     = "awx-platform"
    datacenter  = "rdc"
  }
}
