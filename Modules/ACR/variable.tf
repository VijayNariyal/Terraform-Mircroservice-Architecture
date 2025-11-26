variable "container_registry" {
  description = "Variable for acr resources"
  type = map(object({
    acr_name            = string
    resource_group_name = string
    location            = string
    sku                 = string
    admin_enabled       = bool
  }))
}
