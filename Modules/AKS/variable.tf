variable "aks_clusters" {
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
