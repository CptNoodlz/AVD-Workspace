############################################
# Variable Definitions for AKS Module
############################################

variable "name" {
  type        = string
  description = "Name of the AKS cluster."
}

variable "location" {
  type        = string
  description = "Azure region for the AKS cluster."
  default     = "eastus2"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group in which the AKS cluster will be created."
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version to use for the cluster."
  default     = null # Defaults to latest stable if null
}

variable "sku_tier" {
  type        = string
  description = "SKU tier for the AKS cluster. Standard or Free."
  default     = "Standard"

  validation {
    condition     = contains(["Free", "Standard", "Premium"], var.sku_tier)
    error_message = "sku_tier must be Free, Standard, or Premium."
  }
}

variable "private_cluster_enabled" {
  type        = bool
  description = "Whether to deploy the AKS cluster as a private cluster."
  default     = false
}

# --- Default Node Pool ---

variable "default_node_pool_vm_size" {
  type        = string
  description = "VM size for the default system node pool."
  default     = "Standard_D2s_v3"
}

variable "default_node_pool_node_count" {
  type        = number
  description = "Number of nodes in the default node pool."
  default     = 2
}

variable "default_node_pool_os_disk_size_gb" {
  type        = number
  description = "OS disk size in GB for default node pool nodes."
  default     = 128
}

variable "default_node_pool_subnet_id" {
  type        = string
  description = "Subnet resource ID to attach the default node pool to."
  default     = null
}

# --- Networking ---

variable "network_plugin" {
  type        = string
  description = "Network plugin to use. azure or kubenet."
  default     = "azure"

  validation {
    condition     = contains(["azure", "kubenet", "none"], var.network_plugin)
    error_message = "network_plugin must be azure, kubenet, or none."
  }
}

variable "network_policy" {
  type        = string
  description = "Network policy to use. azure or calico."
  default     = "azure"

  validation {
    condition     = contains(["azure", "calico", "cilium"], var.network_policy)
    error_message = "network_policy must be azure, calico, or cilium."
  }
}

variable "dns_service_ip" {
  type        = string
  description = "IP address for the Kubernetes DNS service. Must be within service_cidr."
  default     = "10.0.0.10"
}

variable "service_cidr" {
  type        = string
  description = "CIDR range for Kubernetes services. Must not overlap with VNet ranges."
  default     = "10.0.0.0/16"
}

# --- Tags ---

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all AKS resources."
  default     = {}
}