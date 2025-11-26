data "azurerm_subnet" "subnet" {
  for_each             = var.network_security_groups
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network
  resource_group_name  = each.value.resource_group_name
}
