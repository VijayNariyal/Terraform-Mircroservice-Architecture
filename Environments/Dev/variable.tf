variable "rgs" {
  description = "Variable of RG"
  type = map(object({
    resource_group_name = string
    location            = string
  }))
}

variable "vnets" {
  description = "A map of virtual network configurations."
  type = map(object({
    vnet_name           = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
    dns_server          = list(string)
    subnets = list(object({
      subnet_name    = string
      address_prefix = list(string)
    }))
  }))
}

variable "nsgs" {
  description = "A map of network security group configurations"
  type = map(object({
    nsg_name            = string
    location            = string
    resource_group_name = string
    subnet_name         = string
    virtual_network     = string
  }))
}

variable "acrs" {
  description = "Variable for ACR"
  type = map(object({
    acr_name            = string
    resource_group_name = string
    location            = string
    sku                 = string
    admin_enabled       = bool
  }))
}

variable "aks_cluster" {
  description = "A map of AKS cluster configurations."
  type = map(object({
    aks_name            = string
    location            = string
    resource_group_name = string
    dns_prefix          = string
    default_node_pool = object({
      pool_name  = string
      node_count = number
      vm_size    = string
    })
  }))
}
