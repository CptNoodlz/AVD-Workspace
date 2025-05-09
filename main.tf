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
  install_patches = {
    linux = {
      classifications_to_include = ["Critical", "Security"]
    }
    reboot_setting = "IfRequired"
    windows = {
      classifications_to_include = ["Critical", "Security"]
    }
  }
  window = {
    time_zone       = "Eastern Standard Time"
    recur_every     = "7Day"
    start_date_time = "2025-05-04 00:00"
    duration        = "2:00"
  }
}

module "avm-res-maintenance-maintenanceconfiguration" {
  source              = "Azure/avm-res-maintenance-maintenanceconfiguration/azurerm"
  version             = "0.1.0"
  location            = var.location
  name                = "TestConfig2"
  resource_group_name = "Testrg1"
  scope               = "InGuestPatch"
  extension_properties = {
    InGuestPatchMode = "User"
  }
  install_patches = {
    linux = {
      classifications_to_include = ["Critical", "Security"]
    }
    reboot_setting = "IfRequired"
    windows = {
      classifications_to_include = ["Critical", "Security"]
    }
  }
  window = {
    time_zone       = "Eastern Standard Time"
    recur_every     = "7Day"
    start_date_time = "2025-05-04 00:00"
    duration        = "2:00"
  }
}

