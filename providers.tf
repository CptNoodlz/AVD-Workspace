terraform {
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