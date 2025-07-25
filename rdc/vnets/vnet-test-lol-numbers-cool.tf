module "vnet-10-0-0-0-tst-lol-numbers-cool" {
  source = "../../modules/vnets/"

  address_space       = ["10.0.0.0/16"]
  location            = "East US"
  name                = "TestVNet"
  resource_group_name = "Testrg1"
  dns_servers = {
    dns_servers = ["8.8.8.8"]
  }
  subnets = {
    "subnet1" = {
      name             = "subnet1"
      address_prefixes = ["10.0.0.0/19"]
    }
    "subnet2" = {
      name             = "subnet2"
      address_prefixes = ["10.0.240.0/24"]
    }
  }
}