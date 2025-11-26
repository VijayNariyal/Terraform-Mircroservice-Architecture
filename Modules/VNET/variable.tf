variable "virtual_networks" {
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
