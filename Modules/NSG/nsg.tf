resource "azurerm_network_security_group" "nsg" {
  for_each            = var.network_security_groups
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "association" {
  for_each                  = var.network_security_groups
  subnet_id                 = data.azurerm_subnet.subnet[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}
