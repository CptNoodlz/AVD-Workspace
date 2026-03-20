############################################
# Outputs  Dev Environment
# Consumed by ansible-platform-awx for cluster access.
############################################

output "aks_cluster_name" {
  description = "AKS cluster name."
  value       = module.aks_dev.cluster_name
}

output "aks_cluster_id" {
  description = "AKS cluster resource ID."
  value       = module.aks_dev.cluster_id
}

output "kube_config_raw" {
  description = "Raw kubeconfig for the dev cluster."
  value       = module.aks_dev.kube_config_raw
  sensitive   = true
}

output "host" {
  description = "Kubernetes API server endpoint."
  value       = module.aks_dev.host
  sensitive   = true
}

output "node_resource_group" {
  description = "MC_ resource group created by AKS."
  value       = module.aks_dev.node_resource_group
}
