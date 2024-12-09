module "avm-res-resources-resourcegroup" {
  source   = "Azure/avm-res-resources-resourcegroup/azurerm"
  version  = "0.1.0"
  location = "eastus2"
  name     = "Testrg1"
}
