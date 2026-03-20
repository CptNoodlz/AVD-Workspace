############################################
# AKS Module
# Deploys an Azure Kubernetes Service cluster
# using the AVM AKS module.
# Outputs kubeconfig + cluster endpoint only.
# Does NOT deploy workloads.
############################################

module "aks" {
  source  = "Azure/avm-res-containerservice-managedcluster/azurerm"
  version = "~> 0.4"

  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  kubernetes_version      = var.kubernetes_version
  sku_tier                = var.sku_tier
  private_cluster_enabled = var.private_cluster_enabled

  default_node_pool = {
    name            = "system"
    vm_size         = var.default_node_pool_vm_size
    node_count      = var.default_node_pool_node_count
    os_disk_size_gb = var.default_node_pool_os_disk_size_gb
    vnet_subnet_id  = var.default_node_pool_subnet_id
  }

  network_profile = {
    network_plugin    = var.network_plugin
    network_policy    = var.network_policy
    dns_service_ip    = var.dns_service_ip
    service_cidr      = var.service_cidr
    load_balancer_sku = "standard"
  }

  identity = {
    type = "SystemAssigned"
  }

  tags = var.tags
}