resource "azurerm_virtual_network" "vnet" {
  for_each            = var.virtual_networks
  name                = each.value.vnet_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space
  dns_servers         = each.value.dns_server

  dynamic "subnet" {
    for_each = each.value.subnets
    content {
      name             = subnet.value.subnet_name
      address_prefixes = subnet.value.address_prefix
    }
  }
  tags = {
    environment = "Production"
  }
}
