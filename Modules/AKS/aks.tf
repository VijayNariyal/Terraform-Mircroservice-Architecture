resource "azurerm_kubernetes_cluster" "aks" {
  for_each            = var.aks_clusters
  name                = each.value.aks_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix

  dynamic "default_node_pool" {
    for_each = each.value.default_node_pool == null ? [] : [each.value.default_node_pool]
    content {
      name       = default_node_pool.value.pool_name
      node_count = default_node_pool.value.node_count
      vm_size    = default_node_pool.value.vm_size
    }
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
