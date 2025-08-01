module "this" {
  source = "../../modules/vnets/"

  address_space       = ["10.0.0.0/16"]
  location            = "East US"
  name                = "TestVNet2"
  resource_group_name = "Testrg1"
  dns_servers = {
    dns_servers = ["8.8.8.8"]
  }
  subnets = {
    "subnet1" = {
      name             = "subnet1"
      address_prefixes = ["10.25.0.0/19"]
    }
    "subnet2" = {
      name             = "subnet2"
      address_prefixes = ["10.35.0.0/19"]
    }
  }
}

module "that" {
  source = "../../modules/vnets/"

  address_space       = ["28.0.0.0/16"]
  location            = "East US"
  name                = "TestVNet3"
  resource_group_name = "Testrg1"
  dns_servers = {
    dns_servers = ["8.8.8.8"]
  }
  subnets = {
    "subnet1" = {
      name             = "subnet1"
      address_prefixes = ["28.25.0.0/19"]
    }
    "subnet2" = {
      name             = "subnet2"
      address_prefixes = ["28.35.0.0/19"]
    }
  }
}