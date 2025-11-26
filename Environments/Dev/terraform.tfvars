rgs = {
  "rg1" = {
    resource_group_name = "dev-rg1"
    location            = "central india"
  }
}

vnets = {
  "vnet1" = {
    vnet_name           = "dev-vnet1"
    location            = "central india"
    resource_group_name = "dev-rg1"
    address_space       = ["10.0.0.0/16"]
    dns_server          = ["8.8.8.8", "8.8.4.4"]
    subnets = [
      {
        subnet_name    = "dev-subnet1"
        address_prefix = ["10.0.1.0/24"]
    }]
  }
}

nsgs = {
  "nsg1" = {
    nsg_name            = "dev-nsg1"
    location            = "central india"
    resource_group_name = "dev-rg1"
    subnet_name         = "dev-subnet1"
    virtual_network     = "dev-vnet1"
  }
}

acrs = {
  "acr1" = {
    acr_name            = "devacr1990"
    resource_group_name = "dev-rg1"
    location            = "central india"
    sku                 = "Basic"
    admin_enabled       = false
  }
}

aks_cluster = {
  "cluster1" = {
    aks_name            = "dev-aks1"
    location            = "central india"
    resource_group_name = "dev-rg1"
    dns_prefix          = "devaksdns"
    default_node_pool = {
      pool_name  = "agentpool"
      node_count = 1
      vm_size    = "standard_a2_v2"
    }
  }
}
