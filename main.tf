module "avm-res-resources-resourcegroup" {
  source   = "Azure/avm-res-resources-resourcegroup/azurerm"
  version  = "0.1.0"
  location = "eastus2"
  name     = "Testrg1"
}

module "avm-res-network-virtualnetwork" {
  source              = "Azure/avm-res-network-virtualnetwork/azurerm"
  version             = "0.7.1"
  address_space       = ["10.0.0.0/19"]
  location            = "East US2"
  name                = "TestVnet1"
  resource_group_name = "Testrg1"
}
/*#module "avm-res-sql-managedinstance" {
  source  = "Azure/avm-res-sql-managedinstance/azurerm"
  version = "0.1.0"
  location = "eastus2"
  name = "TestMI"
  resource_group_name = "Testrg1"
  }*/
