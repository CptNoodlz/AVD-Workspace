############################################
# RDC - AKS Platform VNet
# Reno Data Center infrastructure-wide
# subnet management for AKS workloads.
# Consumed by: envs/dev and envs/prod AKS modules.
############################################

module "vnet-rdc-aks-eastus2" {
  source = "../../modules/vnets/"

  name                = "vnet-rdc-aks-eastus2"
  location            = "East US 2"
  resource_group_name = "Testrg1"
  address_space       = toset(["10.10.0.0/16"])
  dns_servers = {
    dns_servers = toset(["168.63.129.16"])
  }

  subnets = {
    snet-aks-system = {
      # System node pool subnet
      address_prefix = "10.10.1.0/24"
    }
    snet-aks-user = {
      # User / workload node pool subnet (AWX pods)
      address_prefix = "10.10.2.0/24"
    }
    snet-aks-ingress = {
      # Internal load balancer / ingress subnet
      address_prefix = "10.10.3.0/24"
    }
    snet-aks-pods = {
      # Azure CNI pod subnet (overlay / pod subnet mode)
      address_prefix = "10.10.4.0/23"
    }
    snet-aks-apiserver = {
      # API server VNet integration subnet
      address_prefix = "10.10.6.0/28"
      delegation = {
        name = "aks-apiserver"
        service_delegation = {
          name    = "Microsoft.ContainerService/managedClusters"
          actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
        }
      }
    }
  }
}
