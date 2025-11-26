variable "network_security_groups" {
  description = "A map of network security group configurations"
  type = map(object({
    nsg_name            = string
    location            = string
    resource_group_name = string
    subnet_name         = string
    virtual_network     = string
  }))
}