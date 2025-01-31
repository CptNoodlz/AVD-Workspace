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
  location            = var.location
  name                = "TestVnet1"
  resource_group_name = "Testrg1"
}
module "avm-res-sql-managedinstance" {
  source                       = "Azure/avm-res-sql-managedinstance/azurerm"
  location                     = var.location
  name                         = "testmi"
  resource_group_name          = "Testrg1"
  subnet_id                    = "TestVnet1"
  storage_size_in_gb           = "512"
  sku_name                     = "GP_Gen5"
  license_type                 = "LicenseIncluded"
  vcores                       = "4"
  administrator_login          = "techadmin"
  administrator_login_password = "PZH24X$3mE!!"
}