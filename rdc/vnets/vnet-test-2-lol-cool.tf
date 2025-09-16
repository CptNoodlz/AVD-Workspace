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
      address_prefixes = ["10.0.25.0/24"]
    }
    "subnet2" = {
      name             = "subnet2"
      address_prefixes = ["10.0.35.0/24"]
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
      address_prefixes = ["28.0.128.0/24"]
      delegation       = null
      private_endpoint_network_policies = "Disabled"
      private_link_service_network_policies_enabled = "False"
    }
    "subnet2" = {
      name             = "subnet2"
      address_prefixes = ["28.0.130.0/24"]
    }
  }
}