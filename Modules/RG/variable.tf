variable "resource_group" {
  description = "Variable of RG"
  type = map(object({
    resource_group_name = string
    location            = string
  }))
}
