module "vnet-10-0-0-0-tst-lol-numbers-cool" {
  source = "../../modules/vnets/"

  address_space       = ["10.0.0.0/16"]
  location            = "East US"
  name                = "TestVNet"
  resource_group_name = "Testrg1"
  subnets = {
    "subnet1" = {
      name             = "subnet1"
      address_prefixes = ["10.0.18.0/19"]
    }
    "subnet2" = {
      name             = "subnet2"
      address_prefixes = ["10.0.26.0/19"]
    }
  }
}