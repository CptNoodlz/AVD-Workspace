############################################
# Provider Configuration  Dev Environment
############################################

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.110"
    }
  }

  # Uncomment and configure when remote state is ready:
  # backend "azurerm" {
  #   resource_group_name  = "rg-rdc-tfstate"
  #   storage_account_name = "strdctfstateeastus2"
  #   container_name       = "tfstate"
  #   key                  = "dev/aks.tfstate"
  # }
}

provider "azurerm" {
  features {}
}
