terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7.2"
    }
    azapi = {
      source  = "azure/azapi"
      version = "~>2.0"
    }
  }
  cloud {

    organization = "OzOrgTest"

    workspaces {
      name = "TestOzOrg"
    }
  }
}

provider "azurerm" {
  subscription_id            = "4bcc135f-80a8-482f-b67b-fc849aa4b7ac"
  skip_provider_registration = false
  features {}
}

provider "azapi" {
  # Configuration options for azapi provider
}
