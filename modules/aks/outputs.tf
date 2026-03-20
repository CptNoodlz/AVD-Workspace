############################################
# Outputs for AKS Module
# Exposes cluster endpoint and kubeconfig.
# Consumed by ansible-platform-awx repo.
############################################

output "cluster_name" {
  description = "Name of the AKS cluster."
  value       = module.aks.name
}

output "cluster_id" {
  description = "Resource ID of the AKS cluster."
  value       = module.aks.resource_id
}

output "cluster_endpoint" {
  description = "Kubernetes API server endpoint. Pass this to ansible-platform-awx."
  value       = module.aks.kube_config[0].host
  sensitive   = true
}

output "kube_config_raw" {
  description = "Raw kubeconfig for the cluster. Pass this to ansible-platform-awx."
  value       = module.aks.kube_config_raw
  sensitive   = true
}

output "node_resource_group" {
  description = "Auto-generated resource group containing AKS node pool resources."
  value       = module.aks.node_resource_group
}

output "identity_principal_id" {
  description = "Principal ID of the AKS system-assigned managed identity."
  value       = module.aks.identity[0].principal_id
}