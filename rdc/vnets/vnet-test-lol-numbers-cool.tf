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
      name           = "subnet1"
      address_prefix = "10.0.32.0/24"
    }
    "subnet2" = {
      name           = "subnet2"
      address_prefix = "10.0.240.0/24"
    }
  }
}