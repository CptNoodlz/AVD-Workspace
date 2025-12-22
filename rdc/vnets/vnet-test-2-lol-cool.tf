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

  address_space       = {"28.0.0.0/16"}
  location            = "East US"
  name                = "TestVNet3"
  resource_group_name = "Testrg1"
  dns_servers = {
    dns_servers = toset(["8.8.8.8"])
  }
  subnets = {
    "subnet1" = {
      name                                  = "subnet1"
      address_prefixes                      = ["28.0.128.0/24"]
      delegation                            = null
      private_endpoint_network_policies     = "Disabled"
      private_link_service_network_policies = "False"
    }
    "subnet2" = {
      name             = "subnet2"
      address_prefixes = ["28.0.130.0/24"]
    }
  }
}

module "example_vnet" {
  source              = "../../modules/vnets/"
  resource_group_name = "Testrg1"
  location            = "East US"
  name                = "vnet-example"
  address_space       = toset(["10.42.0.0/16"])
  dns_servers = {
    dns_servers = toset(["8.8.8.8"])
  }

  subnets = {
    snet-app = {
      address_prefix            = "10.42.1.0/24"
      service_endpoints         = ["Microsoft.Storage", "Microsoft.KeyVault"]
      delegation = {
        name = "webfarm"
        service_delegation = {
          name    = "Microsoft.Web/serverFarms"
          actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
        }
      }
    }
    snet-db = {
      address_prefixes = ["10.42.2.0/24"]
    }
  }
}
