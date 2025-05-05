module "avm-res-resources-resourcegroup" {
  source   = "Azure/avm-res-resources-resourcegroup/azurerm"
  version  = "0.2.1"
  location = "eastus2"
  name     = "Testrg1"
}

module "avm-res-maintenance-maintenanceconfiguration" {
  source              = "Azure/avm-res-maintenance-maintenanceconfiguration/azurerm"
  version             = "0.1.0"
  location            = var.location
  name                = "TestConfig"
  resource_group_name = "Testrg1"
  scope               = "InGuestPatch"
  extension_properties = {
    InGuestPatchMode = "User"
  }

